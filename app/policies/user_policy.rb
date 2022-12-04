class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
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
    user&.has_role?(:Administrador) || user&.id == user.id
  end

  def edit?
    user&.has_role?(:Administrador) || user&.id == user.id
  end

  def destroy?
    user&.has_role?(:Administrador)
  end
end
