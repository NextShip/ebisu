class Ebisu::Paragraph::HeadlineDecorator < Ebisu::ParagraphDecorator
  delegate_all

  def content
    h.content_tag(:h2, { class: "article__headline" }) do
      h.content_tag(:a, object.content, { id: "ebisu_paragraph_headline_#{object.id}" })
    end
  end
end
