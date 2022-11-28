class IdiomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user&.has_role?(:Administrador)
        scope.all
      else
        raise Pundit::NotAuthorizedError
      end
    end
  end

  def index?
    user&.has_role?(:Administrador)
  end

  def show?
    user&.has_role?(:Administrador)
  end

  def create?
    user&.has_role?(:Administrador)
  end

  def new?
    user&.has_role?(:Administrador)
  end

  def update?
    user&.has_role?(:Administrador)
  end

  def edit?
    user&.has_role?(:Administrador)
  end

  def destroy?
    user&.has_role?(:Administrador)
  end
end
