class AgencyAbility
  include CanCan::Ability
  def initialize(user)
    # NOTE: ##################### As an anonymous I

    # should not crud
    return if user.blank?

    # NOTE: ##################### As an authenticated user I
    can :read, Agency, company_id: user.company_id

    # NOTE: ##################### As an user with superadmin role I
    can :read, Agency if user.superadmin?
  end
end
