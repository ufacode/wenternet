class Category < ActiveRecord::Base

  validates :name, presence: true, length: { maximum: 64 }
  validates :uri,  presence: true, length: { maximum: 64 }, uniqueness: true

end
