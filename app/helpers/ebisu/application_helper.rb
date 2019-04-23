module Ebisu
  module ApplicationHelper
    def default_meta_tags
      {
        site: Ebisu.config.site_name,
        separator: '|',
        title: Ebisu.config.site_title,
        reverse: true,
        description: Ebisu.config.site_description,
        og: {
          title: :title,
          description: :description,
          type: 'website',
          url: request.original_url,
          image: 'logo.png',
          site_name: :title,
          locale: 'ja_JP'
        },
        twitter: {
          card: 'ebisu',
          site: 'ebisu'
        }
      }
    end
  end
end
