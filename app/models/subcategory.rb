class Subcategory < ActiveRecord::Base
  belongs_to :category

  validates :name, presence: true, length: { maximum: 255 }
  validates :uri,  presence: true, length: { maximum: 64 }, uniqueness: true
  validates :category_id, presence: true
end
