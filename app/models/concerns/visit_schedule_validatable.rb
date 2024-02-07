module VisitScheduleValidatable
  extend ActiveSupport::Concern

  included do
    validates :due_at, presence: true, if: -> { checklist&.is_planned }
    validates :due_at, absence: true, unless: -> { checklist&.is_planned }
    validate :cant_set_invalid_due_at, on: :update, unless: -> { skip_due_at_validation || !checklist&.is_planned }
    validate :cant_set_incompatible_place_and_checklist
    validate :only_one_of_spot_or_residence_or_place_should_be_here
  end

  private

  def cant_set_invalid_due_at
    errors.add(:due_at, I18n.t("validations.visit_schedule.invalide_due_at")) if due_at.nil? || due_at < DateTime.now
  end

  def cant_set_incompatible_place_and_checklist
    if !place.nil? && !checklist.nil? && (place.company_id != checklist.company_id)
      errors.add(:place, I18n.t("validations.visit_schedule.incompatible_place_and_checklist"))
    end
  end

  def only_one_of_spot_or_residence_or_place_should_be_here
    present_ids = [place_id, residence_id, spot_id].compact
    if present_ids.size !=1
      errors.add(:visit_schedule, I18n.t("validation.visit_schedule.only_one_of_them"))
    end
  end
end
