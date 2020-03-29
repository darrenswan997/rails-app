class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :links, class_name: "link", foreign_key: "reference_id"
  has_many :comments
         #gives username to user on posts
         def username
           return self.email.split('@')[0].capitalize
         end
end
