class Ebisu::Paragraph::PreformattedBodyDecorator < Ebisu::ParagraphDecorator
  delegate_all

  def content
    h.content_tag(:p, object.content.gsub(/(\r\n|\r|\n)/, "<br />").html_safe, { class: "article__text" })
  end

  def required_reading_time
  	object.content.length * 60 / 500
  end
end
