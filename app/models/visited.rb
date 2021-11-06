class Visited < ApplicationRecord
  belongs_to :user
  belongs_to :attraction
  validates :user_id, uniqueness: { scope: :attraction_id }
end
