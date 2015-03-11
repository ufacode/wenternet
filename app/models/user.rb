class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:twitter, :facebook]

  belongs_to :city
  has_many :items, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :uid, uniqueness: { scope: :provider }, allow_nil: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.name = auth.info.name
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email || "#{auth.uid}@example.com"
      user.password = Devise.friendly_token[0, 20]
      user.skip_confirmation!
    end
  end
end
