class User < ActiveRecord::Base
  attr_accessible :dob, :email, :first_name, :last_name, :password, :password_confirmation, :role
  has_one :profile
  has_many :comments
  has_many :song_comments

  has_secure_password

  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end
end
