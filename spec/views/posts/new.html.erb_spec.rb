require File.expand_path('spec/spec_helper')

describe "posts/new.html.erb" do
  before(:each) do
    assign(:post, stub_model(Post).as_new_record)
  end

  it "renders new post form" do
    render

    assert_select "form", action: posts_path, method: 'post' do
      assert_select "input#post_title", name: 'post[title]'
      assert_select "textarea#post_body", name: 'post[body]'
    end
    # end
  end
end
