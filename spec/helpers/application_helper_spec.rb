require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe "flash_error_key helper" do
    it "success" do
      expect(flash_error_key("error")).to eq("danger")
    end

    it "failure" do
      expect(flash_error_key("warning")).to eq("warning")
    end
  end
end
