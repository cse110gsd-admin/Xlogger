class Exercise < ActiveRecord::Base
  belongs_to :exerciseable, :polymorphic => true
end
