require 'rails_helper'

RSpec.describe Contur::Server, type: :model do
  describe "validations" do
    it {
      expect(FactoryBot.create(:contur_server)).to be_valid
    }

    it {
      should validate_presence_of(:os_version)
      should validate_presence_of(:hostname)
      should validate_presence_of(:admin_user)
      should validate_presence_of(:access_type)
    }
  end
end
