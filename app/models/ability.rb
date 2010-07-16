class Ability
  include CanCan::Ability

  def initialize(user)
    # visitors
    can :read, :all
    
    # logged in users
    if user
      can :create, Thing
      can [:update,:destroy], Thing do |thing|
         thing.user == user
      end
      
      can :create, Person
      
      can :create, Group
      can :update, Group do |group|
        group.people.include? user.person
      end
      can [:update, :destroy], Group do |group|
        group.user == user
      end
    end                   
  end
end