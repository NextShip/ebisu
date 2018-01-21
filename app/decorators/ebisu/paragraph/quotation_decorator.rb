class Ebisu::Paragraph::QuotationDecorator < Draper::Decorator
  delegate_all

  def content
    h.content_tag(:blockquote, object.content, { class: "article__quotation" })
  end
end
