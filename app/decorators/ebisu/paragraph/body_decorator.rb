class Ebisu::Paragraph::BodyDecorator < Draper::Decorator
  delegate_all

  def content
    h.content_tag(:p, object.content)
  end
end
