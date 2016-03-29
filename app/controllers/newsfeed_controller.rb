class NewsfeedController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = Post.all.reverse_order
  end
end
