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
      h.concat h.tag.img object.image.url
      h.concat h.tag.figcaption object.title
    end
    body = object.paragraphs.rank(:position).map {|p| p.decorate.content}.join.html_safe
    eyecatch + body
  end
end
