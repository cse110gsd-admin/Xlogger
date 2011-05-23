class Workout < ActiveRecord::Base
  
  validates :name, :presence => true
  
  has_many :exercises, :dependent => :destroy
  belongs_to :entry
  belongs_t0 :user
end
