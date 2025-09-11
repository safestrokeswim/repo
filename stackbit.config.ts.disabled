import { defineStackbitConfig } from "@stackbit/types";
import { GitContentSource } from "@stackbit/cms-git";

export default defineStackbitConfig({
  contentSources: [
    new GitContentSource({
      rootPath: ".",
      contentDirs: ["content"],
      models: [
        {
          name: "siteConfig",
          type: "data",
          filePath: "content/site.json",
          fields: [
            { 
              name: "navItems", 
              type: "list", 
              items: { 
                type: "object", 
                fields: [
                  { name: "label", type: "string" },
                  { name: "href", type: "string" }
                ]
              }
            },
            { name: "phone", type: "string" },
            { name: "address", type: "string" },
            { name: "ctaLabel", type: "string" }
          ]
        },
        {
          name: "homePage",
          type: "page",
          urlPath: "/",
          filePath: "content/home.json",
          fields: [
            { name: "heroTagline", type: "string" },
            { name: "heroHeadline", type: "string" },
            { name: "heroSubhead", type: "text" },
            { name: "heroCtaPrimary", type: "string" },
            { name: "heroCtagecondary", type: "string" },
            { name: "trustBadgeText", type: "string" },
            { name: "trustSubtext", type: "string" },
            { name: "reviewsTitle", type: "string" },
            { name: "reviewsSubtitle", type: "string" },
            { 
              name: "reviews", 
              type: "list", 
              items: { 
                type: "object", 
                fields: [
                  { name: "quote", type: "text" },
                  { name: "author", type: "string" },
                  { name: "title", type: "string" },
                  { name: "rating", type: "number" }
                ]
              }
            },
            { name: "ctaTitle", type: "string" },
            { name: "ctaSubtitle", type: "string" },
            { name: "ctaDescription", type: "text" },
            { name: "ctaButtonText", type: "string" }
          ]
        }
      ]
    })
  ],
  siteMap: () => [
    {
      stableId: "home",
      urlPath: "/",
      document: {
        id: "home",
        modelName: "homePage"
      },
      isHomePage: true
    }
  ]
});
