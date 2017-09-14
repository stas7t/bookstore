class Book < ApplicationRecord
  has_many :author_book
  has_many :authors, through: :author_book
  belongs_to :category
  has_many :reviews

  validates :title, :quantity, :price, presence: true
  validates :title, uniqueness: true

  paginates_per 12

  scope :by_category, -> (category_id) { where category_id: category_id }
end
