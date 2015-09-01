get '/' do
  @languages = top_languages
  erb :home
end
