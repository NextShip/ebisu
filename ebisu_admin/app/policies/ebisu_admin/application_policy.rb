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
  end
end