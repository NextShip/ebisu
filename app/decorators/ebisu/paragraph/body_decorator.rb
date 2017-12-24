class Ebisu::Paragraph::BodyDecorator < Draper::Decorator
  delegate_all

  def content
    h.content_tag(:p, object.content, { class: "article__text" })
  end
end
