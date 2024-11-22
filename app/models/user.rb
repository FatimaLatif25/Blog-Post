class User < ApplicationRecord
  rolify
     #provide the rolify methods using association
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #Validation 
  validates :username, presence: true

  has_many :posts
  has_many :comments

  def full_name   #Using access database colums value that not exist int the database
    "#{username} #{email}"
  end

end
