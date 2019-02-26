FactoryBot.define do
  factory :contur_customer, class: "Contur::Customer" do
    sequence(:name) { |n| "test#{n}" }
    sequence(:email) { |n| "test#{n}@test.com" }
    sequence(:phone_number) { |n| "test#{n}" }
    sequence(:fax) { |n| "test#{n}" }
    sequence(:zip_code) { |n| "test#{n}" }
    sequence(:city) { |n| "test#{n}" }
    sequence(:street) { |n| "test#{n}" }
    sequence(:tanss_number) { |n| "test#{n}" }
  end
end
