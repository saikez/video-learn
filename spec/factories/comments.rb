FactoryBot.define do
  factory :comment do
    body { |n| "Awesome comment #{n}" }
    lesson
    user
  end
end
