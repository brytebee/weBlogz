class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
    else
      can :destroy, Post do |post|
        post.author == user
      end
      can :destroy, Comment do |comment|
        comment.author_id == user.id
      end
      can :create, Post
      can :create, Comment
      can :create, Like
      can :read, :all
    end
    #   user ||= User.new # guest user (not logged in)
    #   user.admin? ? can :manage, :all : can :read, :all
  end
end
