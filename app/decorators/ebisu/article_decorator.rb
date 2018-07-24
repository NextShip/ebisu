class Ebisu::ArticleDecorator < Draper::Decorator
  def required_reading_time
    object.paragraphs.reduce(0) { |sum, paragraph| sum + paragraph.decorate.required_reading_time }
  end

  def legible_required_reading_time
    seconds = required_reading_time
    
    if seconds < 60
      h.t('ebisu.dictionary.required_reading_time.less_than_a_minutes')
    else
      h.t('ebisu.dictionary.required_reading_time.read_in', minutes: seconds / 60)
    end
  end

  def body_html
    eyecatch = h.tag.figure do
      h.concat h.content_tag(:img, '', {src: object.image.url})
      h.concat h.tag.figcaption object.title
    end
    body = object.paragraphs.rank(:position).map {|p| p.decorate.content}.join.html_safe
    eyecatch + body
  end

  def analytics
    h.tag.script do
      "(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
 
      ga('create', '#{Ebisu.config.google_analytics_id}', 'auto');
      ga('require', 'displayfeatures');
      ga('set', 'referrer', 'http://www.smartnews.com/');
      ga('send', 'pageview', '#{h.ebisu.article_path(object)}');" 
    end
  end

  def table_of_contents
    object.paragraphs.rank(:position).map do |paragraph|
      if paragraph.is_a? Ebisu::Paragraph::Headline
        [paragraph]
      elsif paragraph.is_a? Ebisu::Paragraph::Subheadline
        paragraph
      end
    end
  end
end
