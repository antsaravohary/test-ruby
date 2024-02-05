class LocationType < ApplicationRecord
  include LocationTypeValidatable

  belongs_to :company
  has_many :spots, dependent: :destroy
  belongs_to :base_location_type
  enum :nature, { common_areas: 0, housing: 1, other_spots: 2, zone: 2 }
end
