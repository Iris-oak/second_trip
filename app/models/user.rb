class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :visiteds, dependent: :destroy
  has_many :visited_attractions, through: :visiteds, source: :attraction

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  def visited(attraction)
    visited_attractions << attraction
  end

  def unvisited(attraction)
    visited_attractions.destroy(attraction)
  end

  def visited?(attraction)
    visited_attractions.include?(attraction)
  end
end