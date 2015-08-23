class Language < ActiveRecord::Base
  has_many :language_learners
  has_many :users, through: :language_learners

  before_create :set_code
  before_destroy { |language| LanguageLearner.destroy_all "language_id = #{language.id}"   }

  private
    def set_code
      self.code = ISO_639.search(self.name)[0][2].upcase
    end

end
