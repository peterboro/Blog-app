class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role == 'admin'
      can :manage, :all
    else
      can :read, :all
      can :create, Post
      can :create, Comment
      can :destroy, Post do |post|
        post.author == user
      end

      can :destroy, Comment do |comment|
        comment.user == user
      end
    end
  end
end
