require 'rails_helper'

RSpec.describe UserDecorator do
  subject { FactoryBot.create(:user).decorate }

  describe "admin_human" do
    context "is admin" do
      before do
        subject.admin = true
      end
      it {
        expect(subject.admin_human).to eq("Ja")
      }
    end

    context "is not admin" do
      before do
        subject.admin = false
      end
      it {
        expect(subject.admin_human).to eq("Nein")
      }
    end
  end

  describe "active_human" do
    context "is active" do
      before do
        subject.account_active = true
      end
      it {
        expect(subject.active_human).to eq("Ja")
      }
    end

    context "is not active" do
      before do
        subject.account_active = false
      end
      it {
        expect(subject.active_human).to eq("Nein")
      }
    end
  end

  describe "active_badge" do
    context "is active" do
      before do
        subject.account_active = true
      end
      it {
        expect(subject.active_badge).to include("badge-success")
      }
    end

    context "is not active" do
      before do
        subject.account_active = false
      end
      it {
        expect(subject.active_badge).to include("badge-danger")
      }
    end
  end

  describe "toggle_switch" do
    context "is active" do
      before do
        subject.account_active = true
      end
      it {
        expect(subject.toggle_switch).to include("fa-toggle-on", "Deaktivieren")
      }
    end

    context "is not active" do
      before do
        subject.account_active = false
      end
      it {
        expect(subject.toggle_switch).to include("fa-toggle-off", "Aktivieren")
      }
    end
  end

  describe "toggle_active_message" do
    context "is active" do
      before do
        subject.account_active = true
      end
      it {
        expect(subject.toggle_active_message).to include("aktiviert")
      }
    end

    context "is not active" do
      before do
        subject.account_active = false
      end
      it {
        expect(subject.toggle_active_message).to include("deaktiviert")
      }
    end
  end
end
