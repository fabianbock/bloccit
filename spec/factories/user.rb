FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now

    factory :user_with_posts_and_comments do
      transient do
        posts_count 3
        comments_count 3
      end

      after(:build) do |user, evaluator|
        create_list(:comment, evaluator.comments_count, user: user)
        create_list(:post, evaluator.posts_count, user: user)
      end
    end
  end
end



# user = create(:user_with_posts_and_comments, posts_count: 3, comments_count: 3)
# expect(user.posts.count).to eq(3)