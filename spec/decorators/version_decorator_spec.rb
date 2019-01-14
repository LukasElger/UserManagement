require 'rails_helper'

RSpec.describe VersionDecorator do

  describe "created_at" do
    subject {
      VersionDecorator.decorate(PaperTrail::Version.new(created_at: Date.new(2018,12,1)))
    }
    it {
      expect(subject.created_at).to eq("01.12.2018")
    }
  end
end
