class User < ActiveRecord::Base
  enum role: [:admin, :user, :lead, :business, :agency]
  acts_as_messageable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
  has_many :posts
  has_many :comments
  
  def mailboxer_email(object)
    return email
  end
  
end
