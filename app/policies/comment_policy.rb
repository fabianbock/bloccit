class CommentPolicy < ApplicationPolicy
  class Scope
      attr_reader :user

      def initialize(user)
        @user = user
      end

  end

  def new?
      create?
  end


  def create?
      user.present?
  end

  def destroy?
      user.present? && (record.user == user || user.admin? || user.moderator?)
  end
  
end