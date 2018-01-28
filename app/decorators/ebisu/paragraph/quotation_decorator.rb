class Ebisu::Paragraph::QuotationDecorator < Ebisu::ParagraphDecorator
  delegate_all

  def content
    h.content_tag(:blockquote, object.content, { class: "article__quotation" })
  end
end
