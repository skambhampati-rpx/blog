require 'spec_helper'

describe Post do
  before do
    @post = Post.new
  end
  it {should validate_presence_of(:name)} 
  it{should_not validate_presence_of(:content)}
end
