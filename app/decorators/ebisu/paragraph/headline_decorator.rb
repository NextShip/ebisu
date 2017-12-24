class Ebisu::Paragraph::HeadlineDecorator < Draper::Decorator
  delegate_all

  def content
    h.content_tag(:h2, object.content, { class: "article__headline" })
  end
end
