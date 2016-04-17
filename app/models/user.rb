class User < ActiveRecord::Base
  enum role: [:admin, :lead, :user, :business, :agency]
  #include Mailboxer::Models::Messageable
  acts_as_messageable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy
  def mailboxer_email(object)
    return email
  end
  
end
