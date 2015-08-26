helpers Gravatarify::Helper

helpers do
  def top_languages
    Language.joins(:language_learners).group("languages.id").order("count(language_learners.language_id) desc").limit(3)
  end

  EasyTranslate.api_key = 'AIzaSyBivCByKj2jybJhv9QWu8q2_oLUXzZIyK8'

  def top_translate(languages)
    languages[0].name.downcase.to_sym
  end
end
