require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.create(:user) }

  it {
    expect(subject).to be_valid
  }

  it {
    expect(subject.name).not_to eq("test123")
  }

  describe "update attributes with data" do
    context "without password" do
      before do
        expect(subject.update_user_data(name: "test123")).to be_truthy
        subject.reload
      end

      it {
        expect(subject.name).to eq("test123")
      }
    end

    context "with wrong password" do
      before do
        expect(subject.update_user_data(name: "test123", password: "test12345")).to be_falsey

        subject.reload
      end

      it {
        expect(subject.name).not_to eq("test123")
      }
    end

    context "with correct password" do
      before do
        expect(subject.update_user_data(name: "test123", password: "test12345", password_confirmation: "test12345")).to be_truthy
        subject.reload
      end

      it {
        expect(subject.name).to eq("test123")
      }
    end
  end

  describe "valid mail" do
    subject { FactoryBot.build(:user, email: "lala@test.de") }

    it {
      expect(subject).to be_valid
    }

    context "invalid mail" do
      before do
        subject.email = "test"
      end

      it {
        expect(subject).not_to be_valid
      }
    end
  end
end
