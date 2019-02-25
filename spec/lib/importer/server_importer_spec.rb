require 'rails_helper'
require './lib/importer/server_importer.rb'

RSpec.describe ServerImporter do
  let(:file) { "./spec/support/files/servers.csv" }
  subject { ServerImporter.new(file) }

  describe "without import" do
    it {
      expect(Contur::Server.count).to eq(0)
    }
  end

  describe "with import" do
    before do
      subject.import
    end

    it {
      expect(Contur::Server.count).not_to eq(25)
    }
  end
end
