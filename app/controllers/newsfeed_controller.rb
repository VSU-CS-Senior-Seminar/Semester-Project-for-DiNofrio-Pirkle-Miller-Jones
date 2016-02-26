class NewsfeedController < ApplicationController
  def index
    @posts = Post.all
  end
end
