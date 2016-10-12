require File.expand_path('spec/spec_helper')

describe "Welcome" do
  describe "GET /" do
    it "displays list of posts" do
      posts = []
      6.times {posts << Post.make!(title: 'This is my post')}
      posts.each{ |post| post.user.identities << Identity.make! }
      visit root_path
      posts.each do |post|
        page.should have_content(post.title)
      end
    end
  end
end
