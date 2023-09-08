class Movie < ApplicationRecord
  has_many :favorites

  include PgSearch::Model
  pg_search_scope :search_by_title_and_director,
  against: [ :title, :director ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
