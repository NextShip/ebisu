class Ebisu::CategoryDecorator < Draper::Decorator
  delegate_all

  def full_name
    category = self
    ancestors = []
    while category
      ancestors.unshift category.name
      category = category.parent
    end

    ancestors.join(' - ')
  end
end
