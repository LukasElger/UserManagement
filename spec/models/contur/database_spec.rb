require 'rails_helper'

RSpec.describe Contur::Database, type: :model do

  describe "validations" do
    it {
      expect(FactoryBot.create(:contur_database)).to be_valid
    }

    it {
      should validate_presence_of(:url)
      should validate_presence_of(:vm_username)
      should validate_presence_of(:github_branch)
      should validate_presence_of(:contur_type)
      should validate_presence_of(:starts_at)
    }

    it {
      should validate_uniqueness_of(:url)
      should validate_uniqueness_of(:github_branch)
    }
  end
end
