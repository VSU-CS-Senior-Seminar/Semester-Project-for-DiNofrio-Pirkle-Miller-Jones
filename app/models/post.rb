class Post < ActiveRecord::Base
  CATEGORY_TYPES = ["Lost & Found", "Jobs", "Misc"]
  
  validates :title, :content, presence: true
  validates :category, inclusion: CATEGORY_TYPES
end
