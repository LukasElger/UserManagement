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

  describe "toggle_admin_message" do
    context "is admin" do
      before do
        subject.admin = true
      end
      it {
        expect(subject.toggle_admin_message).to eq("Benutzer ist nun ein Admin!")
      }
    end

    context "is not admin" do
      before do
        subject.admin = false
      end
      it {
        expect(subject.toggle_admin_message).to eq("Benutzer ist kein Admin mehr!")
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

  describe "active_mark" do
    context "is active" do
      before do
        subject.account_active = true
      end
      it {
        expect(subject.active_mark).to include("fa-check")
      }
    end

    context "is not active" do
      before do
        subject.account_active = false
      end
      it {
        expect(subject.active_mark).to include("fa-times")
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

  describe "toggle_switches" do
    context "account is active" do
      before do
        subject.account_active = true
      end
      it {
        expect(subject.toggle_active_switch).to include("fa-toggle-on", "Deaktivieren")
      }
    end

    context "account is not active" do
      before do
        subject.account_active = false
      end
      it {
        expect(subject.toggle_active_switch).to include("fa-toggle-off", "Aktivieren")
      }
    end

    context "admin is active" do
      before do
        subject.admin = true
      end
      it {
        expect(subject.toggle_admin_switch).to include("fa-toggle-on", "Deaktivieren")
      }
    end

    context "admin is not active" do
      before do
        subject.admin = false
      end
      it {
        expect(subject.toggle_admin_switch).to include("fa-toggle-off", "Aktivieren")
      }
    end
  end
end
