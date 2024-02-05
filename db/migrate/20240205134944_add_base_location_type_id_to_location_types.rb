class AddBaseLocationTypeIdToLocationTypes < ActiveRecord::Migration[7.0]
  def change
    add_reference :location_types, :base_location_type, foreign_key: true, index: true
  end
end
