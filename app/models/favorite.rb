class Favorite < ApplicationRecord
  belongs_to :movie
  belongs_to :list, dependent: :destroy

  validates :movie, presence: true
  validates :list, presence: true
end
