class Vote < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user


  validates :user, presence: true
  validates :movie, presence: true
end
