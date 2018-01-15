class Ebisu::Paragraph::FigureDecorator < Draper::Decorator
  delegate_all

  def content
    h.content_tag(:figure, {class: "article__figure"}) do
      h.content_tag(:img, '', {class: "article__image", src: object.content.url})
    end
  end
end
