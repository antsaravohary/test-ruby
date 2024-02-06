FactoryBot.define do
  factory :issue_type do
    name { "MyString" }
    logo_url { "MyString" }
    company { association :company }
    transient do
      base_location_type { create(:base_location_type) }
    end
    location_type do

      association :location_type, company: company, base_location_type: base_location_type
    end
    base_issue_type do
      association :base_issue_type, base_location_type: base_location_type
    end
  end
end
