require 'rails_helper'

RSpec.describe Contur::Database, type: :model do

  describe "validations" do
    it {
      expect(FactoryBot.create(:contur_database)).to be_valid
    }

    it {
      should validate_presence_of(:url)
    }
  end
end
