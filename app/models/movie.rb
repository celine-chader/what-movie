class Movie < ApplicationRecord
  has_many_and_belongs_to :favorites
  belongs_to :lists, through: :favorites
end
