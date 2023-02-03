class Ability
  include CanCan::Ability
  def initialize(user)
    return unless user.present?

    can :read, :all
    can :manage, :Booking

    return unless user.role == 'admin'

    can [:manage], :all
  end
end
