require 'rails_helper'

describe Post do #describes which class we are testing
  describe "vote methods" do #describes what functionality we are testing

    before do #creates a number of objects and assigns them to an instance variable outside the block. this runs before every one of the method specs b/c data is destroyed between tests
      user = User.new(email: 'a@a.com', password: '12345678')
      user.skip_confirmation!
      user.save
      @post = user.posts.create(title: 'post title', body: 'post bodies must be at least 20 characters')
      3.times { @post.votes.create(value: 1) }
      2.times { @post.votes.create(value: -1) }
    end

    describe '#up_votes' do # the '# signifies that this is an instance method, not a class method'
      it "counts the number of votes with value = 1" do #'it' block takes a string and a block argument to specify the behavior
        expect(@post.up_votes).to eq(4)
      end
    end

    describe '#down_votes' do
      it "counts the number of votes with value = -1" do
        expect(@post.down_votes).to eq(2)
      end
    end

    describe '#points' do
      it "returns the sum of all down and up votes" do
        expect(@post.points).to eq(2)
      end
    end

  end

  describe 'self-upvote' do
    it 'creates an upvote for the user making the post' do
      user = User.new(email: 'a@a.com', password: '12345678')
      user.skip_confirmation!
      user.save
      post = user.posts.create(title: 'post title', body: 'post bodies must be at least 20 characters')
      expect(post.votes.count).to eq(1)
      expect(post.votes.first.user).to eq(user)
    end
  end

end