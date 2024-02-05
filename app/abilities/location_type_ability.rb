# frozen_string_literal: true

class LocationTypeAbility
  include CanCan::Ability
  def initialize(user)
    # NOTE: ##################### As an anonymous I

    # should not crud
    return if user.blank?

    # NOTE: ##################### As an authenticated user I
    can :read, LocationType, company_id: user.company_id

    # NOTE: ##################### As an user with superadmin role I
    can :read, LocationType if user.superadmin?
  end
end
