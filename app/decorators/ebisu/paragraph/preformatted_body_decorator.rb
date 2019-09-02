class Ebisu::Paragraph::PreformattedBodyDecorator < Ebisu::ParagraphDecorator
  delegate_all

  def content

    h.content_tag(:p, object.html_safe, { class: "article__text" })
  end

  def required_reading_time
  	object.content.length * 60 / 500
  end
end
