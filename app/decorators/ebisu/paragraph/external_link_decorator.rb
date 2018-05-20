class Ebisu::Paragraph::ExternalLinkDecorator < Ebisu::ParagraphDecorator
  delegate_all

  def content
    h.link_to object.content, object.url
  end
end
