class Template < ActiveRecord::Base
  belongs_to :user
  
  validates :name, :presence => true
  
  has_many :exercises, :dependent => :destroy  
end
