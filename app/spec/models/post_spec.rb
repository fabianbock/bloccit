require 'rails_helper'

describe Post do #describes which class we are testing
  describe "vote methods" do #describes whiat functionality we are testing

    before do #creates a number of objects and assigns them to an instance variable outside the block. this runs before every one of the method specs b/c data is destroyed between tests
      @post = Post.create(title: 'post title', body: 'post body')
      3.times {@post.votes.create(value: 1)}
      2.times {@post.votes.create(value: -1)}
    end

    describe '#up_votes' do # the '# signifies that this is an instance method, not a class method'
      it "counts the number of votes with value = 1" do #'it' block takes a string and a block argument to specify the behavior
        expect(@post.up_votes).to eq(3)
      end
    end

    describe '#down_votes' do
      it "counts the number of votes with value = -1" do
        expect(@post.down_votes).to eq(2)
      end
    end

    describe '#points' do
      it "returns the sum of all down and up votes" do
        expect(@post.points).to eq(1)
      end
    end

  end

end