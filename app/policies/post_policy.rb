class PostPolicy < ApplicationPolicy

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.admin? || user.moderator?
        scope.all
      else
        scope.where(:published => true)
      end
    end
  end

  def index?
    true
  end

  #def update?
  #  record.user == user || user.admin? || user.moderator?
  #end


  def create?
    user.present?
  end

  def destroy?
    user.present? && (record.user == user || user.moderator? || user.admin?)
  end

end