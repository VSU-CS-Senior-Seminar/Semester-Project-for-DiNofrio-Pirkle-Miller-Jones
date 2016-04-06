class Post < ActiveRecord::Base
  CATEGORY_TYPES = ["Lost & Found", "Jobs", "Misc", "Business", "Agency"]
  belongs_to :user
  has_many :comments
  validates :title, :content, presence: true
  validates :category, inclusion: CATEGORY_TYPES
end