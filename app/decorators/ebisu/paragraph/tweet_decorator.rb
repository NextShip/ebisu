class Ebisu::Paragraph::TweetDecorator < Draper::Decorator
  delegate_all

  def content
  	OEmbed::Providers.get(object.content).html.html_safe
  end
end
