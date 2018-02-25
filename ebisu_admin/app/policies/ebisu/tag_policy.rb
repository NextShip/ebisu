module Ebisu
  class TagPolicy < ApplicationPolicy
    def index?
      admin?
    end

    def show?
      admin?
    end

    def new?
      admin?
    end

    def create?
      new?
    end

    def edit?
      admin?
    end

    def update?
      edit?
    end

    def destroy?
      edit?
    end
  end
end
