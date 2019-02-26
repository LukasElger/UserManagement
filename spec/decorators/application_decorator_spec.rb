require 'rails_helper'

RSpec.describe ApplicationDecorator do
  subject { User.new.decorate }

  it {
    expect(subject.print_date(Date.new(2018, 12, 10))).to eq("10.12.2018")
  }
end
