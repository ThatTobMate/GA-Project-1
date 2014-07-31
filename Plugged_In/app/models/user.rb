class User < ActiveRecord::Base
  attr_accessible :dob, :email, :first_name, :last_name, :password, :password_confirmation, :role
  has_one :profile
  has_many :comments
  has_many :song_comments

  has_secure_password



  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

  def full_name
    [first_name, last_name].join(" ")
  end
end
