class IdiomPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user&.has_role?(:admin) || user&.has_role?(:admin)
        scope.all
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user&.has_role?(:admin)
  end

  def update?
    user&.has_role?(:admin)
  end

  def destroy?
    user&.has_role?(:admin)
  end
end
