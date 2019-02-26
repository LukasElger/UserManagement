FactoryBot.define do
  factory :contur_server, class: "Contur::Server" do
    os_version { "1.0.0" }
    ruby_version { "1.0.0" }
    nginx_version { "1.0.0" }
    postgres_version { "1.0.0" }
    hostname { "Test" }
    admin_user { "Admin" }
    access_type { "Test" }
    customer { |c| c.association(:contur_customer) }
  end
end
