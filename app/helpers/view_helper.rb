helpers Gravatarify::Helper

helpers do
  def top_languages
    Language.joins(:language_learners).group("languages.id").order("count(language_learners.language_id) desc").limit(3)
  end

  EasyTranslate.api_key = ENV['GOOGLE_API_KEY']

  Giphy::Configuration.configure do |config|
    config.api_key = ENV['GIPHY_API_KEY']
  end

  def top_translate(languages)
    languages[0].name.downcase.to_sym
  end

  def has_language?(language)
    user = auth_current_user
    user.languages.include?(language)
  end

  def add_language(language)
    user = auth_current_user
    user.languages << language
  end

  def remove_language(language)
    user = auth_current_user
    user.languages.delete(language.id)
  end

  def random_language
    Language.all.sample.code.to_sym
  end
end
