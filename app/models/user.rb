class User < ActiveRecord::Base
  enum role: [:admin, :lead, :user, :business, :agency]
  acts_as_messageable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
  has_many :posts
  has_many :comments
  has_many :events
  def mailboxer_email(object)
    return email
  end
  
end
