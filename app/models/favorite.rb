class Favorite < ApplicationRecord
  has_many_and_belongs_to :movie
  belongs_to :list, dependent: :destroy

  validates :movie, presence: true
  validates :list, presence: true
end
