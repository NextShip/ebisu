xml.instruct! :xml, version: "1.0"
xml.rss(version: "2.0", 
  'xmlns:gnf': "http://assets.gunosy.com/media/gnf",
  'xmlns:content': "http://purl.org/rss/1.0/modules/content/",
  'xmlns:dc': "http://purl.org/dc/elements/1.1/",
  'xmlns:media': "http://search.yahoo.com/mrss/"
  ) do
  xml.channel do
    xml.title do
      xml.cdata! Ebisu.config.rss_feed_title
    end
    xml.link main_app.ebisu_url
    xml.description do
      xml.cdata! Ebisu.config.rss_feed_description
    end
    xml.image do
      xml.url asset_url('/gunosy-logo.png')
      xml.title do
        xml.cdata! Ebisu.config.rss_feed_title
      end
      xml.link main_app.ebisu_url
    end
    xml.gnf :wide_image_link do
      xml.url asset_url('/gunosy-logo-wide.png')
      xml.title do
        xml.cdata! Ebisu.config.rss_feed_title
      end
      xml.link main_app.ebisu_url
    end

    @articles.each do |article|
      xml.item do
        xml.title do
          xml.cdata! article.title
        end
        xml.link article_url(article)
        xml.guid article.id
        xml.description do
          xml.cdata! article.abstract
        end
        xml.content :encoded do
          xml.cdata! article.decorate.body_html
        end
        xml.media :status, state: "active"
        xml.pubDate article.published_at.rfc822
      end
    end
  end
end
