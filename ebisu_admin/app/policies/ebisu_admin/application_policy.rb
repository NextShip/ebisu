module EbisuAdmin
  class ApplicationPolicy
    attr_reader :user, :record

    def initialize(user, record)
      @user = user
      @record = record
    end

    def writer?
      user && user.has_role?(:writer)
    end

    def admin?
      user && user.has_role?(:admin)
    end

    def writer_or_admin? 
      user && (user.has_role?(:writer) || user.has_role?(:admin))
    end
  end
end
