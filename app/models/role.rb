class Role < ActiveRecord::Base
  # def movie
  #   return Movie.find_by_id(self.movie_id)
  # end
  # def actor
  #   return Actor.find_by_id(self.actor_id)
  # end

  belongs_to :movie
  belongs_to :actor
end
