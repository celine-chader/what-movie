class Favorite < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :movie, presence: true
  validates :list, presence: true
end
