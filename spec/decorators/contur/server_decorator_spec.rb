require 'rails_helper'

RSpec.describe Contur::ServerDecorator do
  subject { FactoryBot.create(:contur_server).decorate }

  it {
    expect(subject.to_label).to eq("#{subject.hostname}")
  }
end
