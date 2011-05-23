class Entry < ActiveRecord::Base

  belongs_to :user

  has_many  :workouts, :dependent =>  :destroy
  has_many  :warmups,  :dependent =>  :destroy
end
