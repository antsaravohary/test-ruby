module BaseIssueTypeValidatable
  extend ActiveSupport::Concern
  included do
    validates :name, presence: { message: I18n.t("validations.base_issue_type.name_presence") }
  end

end
