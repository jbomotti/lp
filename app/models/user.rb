class User < ActiveRecord::Base
  include BCrypt

  has_many :language_learners
  has_many :languages, through: :language_learners

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def fullname
    self.first_name + " " + self.last_name
  end
end
