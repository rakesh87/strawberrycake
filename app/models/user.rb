class User < ActiveRecord::Base

  validates :email, :access_token, :name, :uid, presence: true
  validates :email, uniqueness: true

  has_many :posts, dependent: :destroy

  def self.find_or_create_with_omniauth(auth)
    user = where(provider: auth.provider, uid: auth.uid).first_or_create
    user.assign_attributes({ name: auth.info.name, email: auth.info.email, photo_url: auth.info.image, access_token: auth.credentials.token })
    user.save!
    user
  end
end
