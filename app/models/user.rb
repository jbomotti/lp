class User < ActiveRecord::Base
  include BCrypt

  has_many :language_learners
  has_many :languages, through: :language_learners

  validates :username, presence: true, uniqueness: true

  # Time for the BCrypt password magic!
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
