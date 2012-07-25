namespace :minamirb do
  desc "populate the database with number of records specified by count"
  task random_data: :environment do
    usage = <<-USAGE
   Please specify the number of posts to create
   rake minamirb:random_data count=100
    USAGE
    puts usage and return unless ENV["count"]
    Post.delete_all
    ENV["count"].to_i.times do
      attr_hash = { name: Faker::Name.name, title: Faker::Company.bs, content: Faker::Lorem.paragraph }
      post = Post.new(attr_hash)
      rand(60).times do
        comment_attr = { commenter: Faker::Internet.user_name, body: Faker::Company.catch_phrase }
        post.comments.new(comment_attr)
      end
      post.save
    end
  end
end

