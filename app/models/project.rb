class Project < ActiveRecord::Base
  belongs_to :user
  attr_accessible :description, :goal, :teaser, :title
end
