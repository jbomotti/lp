helpers Gravatarify::Helper

helpers do
  def top_languages
    Language.joins(:language_learners).group("languages.id").order("count(language_learners.language_id) desc").limit(3)
  end
end
