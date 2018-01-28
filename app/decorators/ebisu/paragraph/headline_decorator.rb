class Ebisu::Paragraph::HeadlineDecorator < Ebisu::ParagraphDecorator
  delegate_all

  def content
    h.content_tag(:h2, object.content, { class: "article__headline" })
  end
end
