helpers Gravatarify::Helper

helpers do
  def top_languages
    Language.joins(:language_learners).group("languages.id").order("count(language_learners.language_id) desc").limit(3)
  end
end

helpers do
  EasyTranslate.api_key = 'AIzaSyBivCByKj2jybJhv9QWu8q2_oLUXzZIyK8'
end
