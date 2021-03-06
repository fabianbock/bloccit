require 'rails_helper'


describe Vote do

  include TestFactories

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

  describe 'after_save' do
     it "calls `Post#update_rank` after save" do
       post = associated_post
       vote = Vote.new(value: 1, post: post)
       expect(post).to receive(:update_rank)
       vote.save
     end
   end
end

