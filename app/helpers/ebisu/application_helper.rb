module Ebisu
  module ApplicationHelper
    def default_meta_tags
      {
        site: 'Ebisu',
        separator: '|',
        title: 'Ebisu',
        reverse: true,
        description: 'This is Media',
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
