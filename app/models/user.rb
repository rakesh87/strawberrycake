class User < ActiveRecord::Base
  attr_accessible :name, :email

  validates :name, :email, presence: true
  has_many :posts, dependent: :destroy
end
