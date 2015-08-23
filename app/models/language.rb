class Language < ActiveRecord::Base
  has_many :language_learners
  has_many :users, through: :language_learners

  before_create :set_code

  private
    def set_code
      self.code = ISO_639.search(self.name)[0][2].upcase
    end

end
