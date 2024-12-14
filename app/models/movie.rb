# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord


  validates(:director_id, presence: true)
  validates(:title, uniqueness: true)

  belongs_to(:director, foreign_key: "director_id", class_name: "Director")

  has_many(:characters, foreign_key: "movie_id", class_name: "Character")

  def cast
    actor_ids = self.characters.pluck(:actor_id)
    actors = Actor.where({ :id => actor_ids })
    return actors
  end

  
  #def director
  #  x = self.director_id
  #
  #  return Director.where({ :id => x }).first
  #end
end
