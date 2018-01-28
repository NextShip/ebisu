class Ebisu::Paragraph::YoutubeDecorator < Ebisu::ParagraphDecorator
  delegate_all

  def content
  	OEmbed::Providers.get(object.content).html.html_safe
  end
end
