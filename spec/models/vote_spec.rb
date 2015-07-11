require 'rails_helper'

describe Vote do
  describe "validations" do
    describe "value validation" do
      it "only allows -1 or 1 as values" do
        # your expectations here
        expect(Vote.new(value: 1).valid?).to be(true)
        expect(Vote.new(value: -1).valid?).to be(true)
        expect(Vote.new(value: 0).valid?).to be(false)
        expect(Vote.new(value: 2).valid?).to be(false)
      end
    end
  end
end