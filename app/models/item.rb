class Item < ActiveRecord::Base
  include AASM

  belongs_to :category
  belongs_to :subcategory
  belongs_to :city
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  validates :title,          presence: true, length: { maximum: 255 }
  validates :price,          numericality: { greater_than_or_equal_to: 1 }, allow_nil: true
  validates :category_id,    presence: true
  validates :subcategory_id, presence: true
  validates :city_id,        presence: true
  validates :email,          presence: true
  validates :phone,          presence: true

  scope :newest,         -> { order("created_at DESC") }
  scope :published,      -> { where(state: :published) }
  scope :pages,       ->(p) { page(p).per(15) }

  aasm column: :state do
    state :drafted, initial: true
    state :published

    event :publish do
      transitions from: :drafted, to: :published
    end

    event :draft do
      transitions from: :published, to: :drafted
    end
  end
end
