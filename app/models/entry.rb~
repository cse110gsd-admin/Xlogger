class Entry < ActiveRecord::Base

  belongs_to :user

  has_one  :workout, :dependent =>  :destroy
  has_one  :warmup,  :dependent =>  :destroy
end
