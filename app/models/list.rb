class List < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :movies, through: :favorites

  validates :name, presence: true
  validates :name, uniqueness: true
end
