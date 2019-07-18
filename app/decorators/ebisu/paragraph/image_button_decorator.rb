class Ebisu::Paragraph::ImageButtonDecorator < Ebisu::ParagraphDecorator
  delegate_all

  def content
    h.link_to(object.link_to) do
      h.content_tag(:div, style: 'text-align: center;') do
        h.content_tag(:img, '', {class: "", src: object.content.url, alt: object.alt})
      end
    end
  end
end
