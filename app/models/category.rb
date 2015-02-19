class Category < ActiveRecord::Base
  has_many :subcategories, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :uri,  presence: true, length: { maximum: 64 }, uniqueness: true
end
