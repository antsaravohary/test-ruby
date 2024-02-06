require 'rails_helper'

RSpec.describe BaseIssueType, type: :model do
  let(:base_issue_type) { create(:base_issue_type) }

  describe "#name" do
    it "is valid" do
      expect do
        base_issue_type.name = nil
        base_issue_type.save!
      end.to raise_error(ActiveRecord::RecordInvalid)

      expect do
        base_issue_type.name = ""
        base_issue_type.save!
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe "#base_location_type" do
    it "is no empty" do
      expect do
        base_issue_type.base_location_type = nil
        base_issue_type.save!
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
