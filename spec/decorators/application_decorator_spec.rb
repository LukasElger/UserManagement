require 'rails_helper'

RSpec.describe ApplicationDecorator do
  subject { User.new.decorate }

  it {
    expect(subject.print_date(Date.new(2018, 12, 10))).to eq("10.12.2018")
  }

  describe "card_block_attr" do
    context "attr present" do
      before do
        allow(subject.model).to receive_messages(name: "Test")
      end
      it { expect(subject.card_block_attr(:name)).to include("col-sm-3", "Name", "col-sm-9", "Test") }
    end
    context "else" do
      before do
        allow(subject.model).to receive_messages(name: nil)
      end
      it { expect(subject.card_block_attr(:name)).to include("col-sm-3", "Name", "col-sm-9", "N/A") }

    end
  end
end
