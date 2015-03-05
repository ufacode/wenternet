class Subcategory < ActiveRecord::Base
  belongs_to :category

  validates :name, presence: true, length: { maximum: 255 }
  validates :uri,  presence: true, length: { maximum: 64 }, uniqueness: { scope: :category }
  validates :category_id, presence: true

  def to_param
    uri
  end
end
