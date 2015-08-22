class Language < ActiveRecord::Base
  has_many :language_learners
  has_many :users, through: :language_learners
end
