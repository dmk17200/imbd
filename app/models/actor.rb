class Actor < ActiveRecord::Base
  def role
    return Role.where(:actor_id => self.id)
  end
  def movie
    return Movie.where(:actor_id => self.id)
  end
end
