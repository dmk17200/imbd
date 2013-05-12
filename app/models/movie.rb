  class Movie < ActiveRecord::Base
  # def director
  #   return Director.find_by_id(self.director_id)
  # end
  # def roles
  #   return Role.where(:movie_id => self.id)
  # end
  belongs_to :director
  has_many :roles
  has_many :votes
  has_many :users, :through => :votes
end
