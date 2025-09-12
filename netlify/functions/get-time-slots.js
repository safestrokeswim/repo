const { createClient } = require('@supabase/supabase-js');

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_SERVICE_KEY
);

exports.handler = async (event, context) => {
  // Enable CORS
  const headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Headers': 'Content-Type',
    'Access-Control-Allow-Methods': 'GET, OPTIONS',
    'Content-Type': 'application/json',
  };

  // Handle preflight requests
  if (event.httpMethod === 'OPTIONS') {
    return { statusCode: 200, headers, body: '' };
  }

  if (event.httpMethod !== 'GET') {
    return {
      statusCode: 405,
      headers,
      body: JSON.stringify({ error: 'Method not allowed' }),
    };
  }

  try {
    const { program, date, month } = event.queryStringParameters || {};

    console.log('=== GET TIME SLOTS REQUEST ===');
    console.log('Query parameters:', { program, date, month });

    if (!program) {
      return {
        statusCode: 400,
        headers,
        body: JSON.stringify({ error: 'Program parameter is required' }),
      };
    }

    let query = supabase
      .from('time_slots')
      .select('*')
      .eq('lesson_type', program)
      .eq('status', 'available')
      .order('date', { ascending: true })
      .order('start_time', { ascending: true });

    // If specific date provided
    if (date) {
      console.log(`Filtering by specific date: ${date}`);
      query = query.eq('date', date);
    } 
    // If month provided (for calendar view)
    else if (month) {
      const monthDate = new Date(month);
      const firstDay = new Date(monthDate.getFullYear(), monthDate.getMonth(), 1);
      const lastDay = new Date(monthDate.getFullYear(), monthDate.getMonth() + 1, 0);
      
      const firstDayStr = firstDay.toISOString().split('T')[0];
      const lastDayStr = lastDay.toISOString().split('T')[0];
      
      console.log(`Filtering by month range: ${firstDayStr} to ${lastDayStr}`);
      
      query = query
        .gte('date', firstDayStr)
        .lte('date', lastDayStr);
    }
    // Default: get next 30 days
    else {
      const today = new Date();
      const thirtyDaysFromNow = new Date(today);
      thirtyDaysFromNow.setDate(thirtyDaysFromNow.getDate() + 30);
      
      const todayStr = today.toISOString().split('T')[0];
      const thirtyDaysStr = thirtyDaysFromNow.toISOString().split('T')[0];
      
      console.log(`Filtering by default range: ${todayStr} to ${thirtyDaysStr}`);
      
      query = query
        .gte('date', todayStr)
        .lte('date', thirtyDaysStr);
    }

    console.log('Executing database query...');
    const { data: timeSlots, error } = await query;

    if (error) {
      console.error('Database error:', error);
      return {
        statusCode: 500,
        headers,
        body: JSON.stringify({ 
          error: 'Database query failed',
          details: error.message 
        }),
      };
    }

    console.log(`Found ${timeSlots ? timeSlots.length : 0} total time slots`);

    // Debug: Log some sample slots
    if (timeSlots && timeSlots.length > 0) {
      console.log('Sample slots:', timeSlots.slice(0, 3).map(s => ({
        date: s.date,
        start_time: s.start_time,
        lesson_type: s.lesson_type,
        current_enrollment: s.current_enrollment,
        max_capacity: s.max_capacity
      })));
    }

    // Filter out full slots (but include in logs for debugging)
    const availableSlots = timeSlots.filter(slot => 
      slot.current_enrollment < slot.max_capacity
    );

    console.log(`Filtered to ${availableSlots.length} available slots`);

    // If no available slots found, log debugging info
    if (availableSlots.length === 0) {
      console.log('=== NO AVAILABLE SLOTS FOUND ===');
      console.log('Total slots before filtering:', timeSlots.length);
      
      if (timeSlots.length > 0) {
        const fullSlots = timeSlots.filter(s => s.current_enrollment >= s.max_capacity);
        console.log(`Full slots: ${fullSlots.length}`);
        console.log('Full slot examples:', fullSlots.slice(0, 2).map(s => ({
          date: s.date,
          start_time: s.start_time,
          enrollment: s.current_enrollment,
          capacity: s.max_capacity
        })));
      } else {
        console.log('No time slots exist for this program/date range');
        console.log('Suggestion: Run initialize-time-slots function');
      }
    }

    return {
      statusCode: 200,
      headers,
      body: JSON.stringify(availableSlots),
    };

  } catch (error) {
    console.error('Get time slots error:', error);
    return {
      statusCode: 500,
      headers,
      body: JSON.stringify({ 
        error: 'Failed to retrieve time slots',
        details: error.message,
        stack: error.stack
      }),
    };
  }
};