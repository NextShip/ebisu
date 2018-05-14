xml.instruct! :xml, version: "1.0"
xml.rss(version: "2.0", 'xmlns:nordot': "https://www.nordot.jp/inputrss/strict/1.0") do
  xml.channel do
    xml.nordot :unitId, ENV['EBISU_NORDOT_CONTENTSHOLDER_UNITID']

    @articles.each do |article|
      xml.item do
        xml.nordot :guid, article_url(article)
        xml.nordot :fedAt, article.updated_at.httpdate
        xml.nordot :deleted, false
        xml.nordot :title, article.title
        xml.nordot :subtitle, article.abstract
        xml.nordot :status, "public"
        xml.nordot :bodyType, "nordot_html"
        xml.nordot :body do
          xml.cdata! article.body_html
        end
        xml.nordot :publishedAt, article.published_at.httpdate
        # xml.nordot :expiredAt, ""
        xml.nordot :labels, article.tags.map(&:name).join(",")
        # xml.nordot :seriesId, 0
        # xml.nordot :topicIds, ""
        xml.nordot :sourceUrl, article_url(article)
        # xml.nordot :convertImageId, ""
      end
    end
  end
end
