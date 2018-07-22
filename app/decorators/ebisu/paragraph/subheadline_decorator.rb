class Ebisu::Paragraph::SubheadlineDecorator < Ebisu::ParagraphDecorator
  delegate_all

  def content
    h.content_tag(:h3, { class: "article__subheadline" }) do
      h.content_tag(:a, object.content, { id: "ebisu_paragraph_subheadline_#{object.id}" })
    end
  end
end
