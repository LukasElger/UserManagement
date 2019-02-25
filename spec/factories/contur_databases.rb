FactoryBot.define do
  factory :contur_database, class: "Contur::Database" do
    sequence(:url) { |n| "http://www.test.de/#{n}" }
    sequence(:github_branch) { |n| "Branch_#{n}" }
    vm_username { "VM-Username" }
    contur_type { Contur::Database::CONTUR }
    server { |c| c.association(:contur_server) }
    comment { "Comment of Contur_Database" }
    starts_at { Date.new(2018,12,12) }
    ends_at { Date.new(2018,12,12) }
  end
end
