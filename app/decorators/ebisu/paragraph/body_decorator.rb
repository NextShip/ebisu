class Ebisu::Paragraph::BodyDecorator < Draper::Decorator
  delegate_all

  def content
  	sanitized_content = h.sanitize(object.content)
    h.content_tag(:p, sanitized_content.gsub(/(\r\n|\r|\n)/, "<br />").html_safe, { class: "article__text" })
  end
end
