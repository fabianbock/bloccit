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

end