class UserDecorator < Draper::Decorator
  delegate_all
  
  def name_or_email
    if object.respond_to?(:name)
      object.name
    else
      # email must be supported for devise.
      object.email
    end
  end
end
