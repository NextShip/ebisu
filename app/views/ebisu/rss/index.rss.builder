xml.instruct! :xml, version: "1.0"
xml.rss("version" => "2.0") do
  xml.channel do
    xml.title Ebisu.config.rss_feed_title
    xml.description Ebisu.config.rss_feed_description
    xml.link main_app.ebisu_url
    xml.language 'ja'
    xml.lastBuildDate Time.now.strftime("%a, %d %b %Y %H:%M:%S %Z")
    @articles.each do |article|
      xml.item do
        xml.title article.title
        xml.description do
          xml.cdata! article.abstract
        end
        xml.pubDate article.published_at.strftime("%a, %d %b %Y %H:%M:%S %Z")
        xml.link article_url(article)
        xml.guid article_url(article)
      end
    end
  end
end
