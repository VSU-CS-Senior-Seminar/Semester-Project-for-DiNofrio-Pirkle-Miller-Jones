class NewsfeedController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if current_user.role.eql?"agency"
      redirect_to newsfeed_agency_path
    end
    if current_user.role.eql?"business"
      redirect_to newsfeed_businesses_path
    end
    @posts = Post.all.reverse_order
    @events = Event.all
  end
  
  def businesses
    if current_user.role.eql?"agency"
      redirect_to newsfeed_agency_path
    end
    if current_user.role.eql?"user"
      redirect_to newsfeed_index_path
    end
    if current_user.role.eql?"lead"
      redirect_to newsfeed_index_path
    end
    @posts = Post.all.reverse_order
  end  
  
  def agency
    if current_user.role.eql?"business"
      redirect_to newsfeed_businesses_path
    end
    if current_user.role.eql?"user"
      redirect_to newsfeed_index_path
    end
    if current_user.role.eql?"lead"
      redirect_to newsfeed_index_path
    end
    @posts = Post.all.reverse_order
  end
end
