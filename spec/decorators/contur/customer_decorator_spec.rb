require 'rails_helper'

RSpec.describe Contur::CustomerDecorator do
  subject { FactoryBot.create(:contur_customer).decorate }

  it {
    expect(subject.to_label).to eq("#{subject.name}")
  }
end
