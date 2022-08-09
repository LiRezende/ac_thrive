class IdiomPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.has_role?(:admin)
      scope.all
      end
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def edit?
    user&.has_role?(:admin)
  end
end
