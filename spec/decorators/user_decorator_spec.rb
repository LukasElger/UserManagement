require 'rails_helper'

RSpec.describe UserDecorator do
  subject { FactoryBot.create(:user).decorate }

  describe "admin_human" do
    context "admin true" do
      before do
        subject.admin = true
      end
      it {
        expect(subject.admin_human).to eq("Ja")
      }
    end

    context "admin false" do
      before do
        subject.admin = false
      end
      it {
        expect(subject.admin_human).to eq("Nein")
      }
    end
  end

  describe "active_human" do
    context "active true" do
      before do
        subject.account_active = true
      end
      it {
        expect(subject.active_human).to eq("Ja")
      }
    end

    context "active false" do
      before do
        subject.account_active = false
      end
      it {
        expect(subject.active_human).to eq("Nein")
      }
    end
  end
end
