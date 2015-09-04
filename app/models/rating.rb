class Rating < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  belongs_to :voter, class_name: 'User'

  validates :rating, :item_id, :user_id, :voter_id, presence: true
  validates :voter_id, uniqueness: { scope: :item_id,
                                     message: 'has already voted' }

  def self.dublicate?(item, voter)
    exists?(item: item, voter: voter)
  end
end
