require 'rails_helper'

RSpec.describe Contur::DatabaseDecorator do
  subject { FactoryBot.create(:contur_database).decorate }

  it {
    expect(subject.server_name).to eq("#{subject.server.hostname}")
  }

  it {
    expect(subject.to_label).to eq("#{subject.vm_username} - #{subject.server_name}")
  }
end
