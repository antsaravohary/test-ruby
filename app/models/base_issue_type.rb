class BaseIssueType < ApplicationRecord
  belongs_to :base_location_type
  include BaseIssueTypeValidatable
end
