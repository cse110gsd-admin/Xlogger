# == Schema Information
# Schema version: 20110510070410
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  password   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation
  has_many :events
  has_many :workouts
  has_many :calendars

  ###attr_accessible :name, :email  ## for changing everyone
  
  # regex explained:   http://ruby.railstutorial.org/chapters/modeling-and-viewing-users-one#sec:user_validations
  # /		start of the regex
  # \A	Match the beginning of a string (~~with~~)
  # [\W+\-.]+	 	At least one word character, plus hyphen or dot.
  # @		just an actual at sign
  # [a-z]\d\-.]+	at least one (the "+") letter ("[a-z]"), digit ("\d"), hyphen or dot ("\-.")
  # \.	an actual dot
  # [a-z]+	at least one letter
  # \Z		end of a string
  # /		end of regex
  # /i	case insensitive.

  # OH WHAT?  http://www.rubular.com/
  # Ruby Regular expression editor!?!?
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # validates ":thing, :presence => true"   Tests whether the thing is presence
  # validates ":thing, :length => {  :maximum => 50 }"     Tests if thing is length <50 
  validates :name, 	:presence => true,
		 	:length => { :minimum => 5 },  # Executive decision for minimum 5 
		 	:length => { :maximum => 18 }, # Again arbitrary decision
		 	:uniqueness => true  
		 	#for uniqueness, optional "uniqueness => {:case_sensitive => ture/false } "
  validates :password,	:presence => true,
                        :confirmation => true,
			:length => { :within => 6..40 } # minimum 5 char password.

  
							
  validates :email,	:presence => true,
                        :uniqueness => {:case_sensitive => false},
                        :format => { :with => email_regex } #checks that email is in email format
  before_save :encrypt_password

  def has_password?(submitted_password)    
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  private
    
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
  
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end



#######
### Just FYI the validation for uniqueness is NOT guaranteed to work 100%
### In particular, if 2 users register simultaneously, they will BOTH get
### that username.  Granted, since only 1 (or 2) people are going to be
### using this at any given time, we wont have this problem, but it IS
### possible.  (So if anyone plans on expanding this, make sure to ensure
### user uniqueness at the database level!
#######
