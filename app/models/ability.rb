class Ability
  include CanCan::Ability

  def initialize(user)
    # visitors
    can :read, :all
    
    # logged in users
    if user
      can :create, Thing
      
      can [:update,:destroy], Thing do |thing|
        user.owns? thing
      end
      
      can :update, User
    end                   
  end
end