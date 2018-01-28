class Ebisu::Paragraph::FigureDecorator < Draper::Decorator
  delegate_all

  def content
    h.content_tag(:figure, {class: "article__figure"}) do
      h.concat h.content_tag(:img, '', {class: "article__image", src: object.content.url})
      h.concat (
        h.content_tag(:figcaption, {class: "article_figcaption"}) do
          h.link_to("#{h.t('ebisu.activerecord.attributes.figure.source')}: #{object.source}", object.source_url)
        end
      )
    end
  end
end
