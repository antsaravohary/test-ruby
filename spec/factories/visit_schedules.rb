FactoryBot.define do
  factory :visit_schedule do
    due_at { Date.today.next_month }
    checklist

    trait :with_place do
      place
    end

    trait :with_spot do
      spot
    end

    trait :with_residence do
      residence
    end
  end
end
