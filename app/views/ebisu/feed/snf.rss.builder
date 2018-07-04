xml.instruct! :xml, version: "1.0"
xml.rss(version: "2.0",
  'xmlns:content': "http://purl.org/rss/1.0/modules/content/",
  'xmlns:dc': "http://purl.org/dc/elements/1.1/",
  'xmlns:media': "http://search.yahoo.com/mrss/",
  'xmlns:snf': "http://www.smartnews.be/snf") do
  xml.channel do
    # required
    xml.title Ebisu.config.rss_feed_title
    xml.link main_app.ebisu_url
    xml.description Ebisu.config.rss_feed_description
    xml.pubDate Time.now.httpdate

    # optional
    # xml.language
    # xml.copyright
    # xml.ttl
    xml.snf :logo do
      xml.url Ebisu.config.logo_url
    end

    @articles.each do |article|
      xml.item do
        # required
        xml.title article.title
        xml.link article_url(article)
        xml.pubDate article.published_at
        xml.content :encoded do
          xml.cdata! article.decorate.body_html
        end

        # optional
        # xml.guid
        xml.description do
          xml.cdata! article.abstract
        end
        # xml.category
        # xml.dc :creator
        # xml.dc :language
        # xml.media :thumbnail
        # xml.snf :video
        # xml.media :status
        # xml.snf :advertisement
        xml.snf :analytics do
          xml.cdata! article.decorate.analytics
        end
      end
    end
  end
end
