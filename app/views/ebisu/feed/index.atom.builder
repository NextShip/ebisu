xml.instruct! :xml, version: "1.0"

xml.feed(
    'xml:lang': 'ja-JP',
    xmlns: "http://www.w3.org/2005/Atom"
  ) do
  xml.link(rel: :self, href: main_app.ebisu_url, type: "application/rss+xml")
  xml.title Ebisu.config.rss_feed_title
  xml.subtitle Ebisu.config.rss_feed_description
  xml.updated Time.now.httpdate

  @articles.each do |article|
    xml.entry do
      xml.id article_url(article)
      xml.link(rel: :self, href: article_url(article), type: "application/rss+xml")
      xml.published article.published_at.httpdate
      xml.updated article.updated_at.httpdate
      xml.title article.title
      xml.summary article.abstract
      xml.content(type: :html) do
        xml.cdata! article.decorate.body_html
      end
      xml.author do
        xml.name article.user.email
      end
    end
  end
end
