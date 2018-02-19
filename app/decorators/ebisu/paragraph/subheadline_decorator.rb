class Ebisu::Paragraph::SubheadlineDecorator < Ebisu::ParagraphDecorator
  delegate_all

  def content
    h.content_tag(:h3, object.content, { class: "article__subheadline" })
  end
end
