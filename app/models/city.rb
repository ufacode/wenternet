class City < ActiveRecord::Base

  has_many :users

  validates :name, presence: true, length: { maximum: 255 }
  validates :uri,  presence: true, length: { maximum: 64 }, uniqueness: true

end
