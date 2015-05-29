class User < ActiveRecord::Base
  has_many :users

  attr_accessor :password

  before_save :encrypt_password
  after_save :clear_password

  validates :firstname, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true
  validates :password, :confirmation => true
#Only on Create so other actions like update password attribute can be nil
  validates_length_of :password, :in => 6..20, :on => :create
  
  def match_password(login_password="")
  	encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end
  def encrypt_password
  	unless password.blank?
  		self.salt = BCrypt::Engine.generate_salt
  		self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
  	end
  end
  def clear_password
  	self.password = nil
  end

end
