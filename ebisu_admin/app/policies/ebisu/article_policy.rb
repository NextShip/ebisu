module Ebisu
  class ArticlePolicy < ApplicationPolicy
    def new?
      writer? || admin?
    end

    def create?
      new?
    end

    def edit?
      (writer? && user == record.user) || user.has_role?(:admin)
    end

    def update?
      edit?
    end

    def destroy?
      edit?
    end
  end
end
