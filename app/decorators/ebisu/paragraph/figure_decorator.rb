class Ebisu::Paragraph::FigureDecorator < Ebisu::ParagraphDecorator
  delegate_all

  def content
    h.content_tag(:figure, {class: "article__figure ebisu__article_figure"}) do
      h.concat h.content_tag(:img, '', {class: "article__image ebisu__paragraph_image", src: object.content&.thumb('780x405>')&.url})
      if object.source_url.present? && object.source.present?
        h.concat (
          h.content_tag(:figcaption, {class: "article_figcaption"}) do
            h.link_to("#{h.t('ebisu.activerecord.attributes.figure.source')}: #{object.source}", object.source_url, rel: 'nofollow')
          end
        )
      end
    end
  end
end
