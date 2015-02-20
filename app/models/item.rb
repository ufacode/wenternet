require 'aasm'

class Item < ActiveRecord::Base
  include AASM

  belongs_to :category
  belongs_to :subcategory
  belongs_to :city
  belongs_to :user
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images

  validates :title,          presence: true, length: { maximum: 255 }
  validates :price,          numericality: { greater_than_or_equal_to: 0.01 }, allow_nil: true
  validates :category_id,    presence: true
  validates :subcategory_id, presence: true
  validates :city_id,        presence: true
  validates :email,          presence: true
  validates :phone,          presence: true
  # validates :user_id, presence: true

  aasm column: :state, whiny_transitions: false do
    state :draft, initial: true
    state :published

    event :publish do
      transitions from: :draft, to: :published
    end

    event :draft do
      transitions from: :published, to: :draft
    end
  end
end
