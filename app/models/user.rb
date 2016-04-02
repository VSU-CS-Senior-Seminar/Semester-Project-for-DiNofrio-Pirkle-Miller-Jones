class User < ActiveRecord::Base
  enum role: [:admin, :user, :lead, :business, :agency]
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
  has_many :posts
  has_many :comments
end
