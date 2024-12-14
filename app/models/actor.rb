# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  validates(:name, presence: true)

  has_many(:characters, foreign_key: "actor_id", class_name: "Character")

  #has_many(:filmography, foreign_key: "", class_name: "Movie")

  def filmography
    movie_ids = self.characters.pluck(:movie_id)
    movies = Movie.where({ :id => movie_ids })
    return movies
  end
end
