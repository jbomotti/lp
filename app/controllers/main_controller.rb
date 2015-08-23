get '/' do
  @languages = top_languages
  erb :home
end

get '/about' do
  erb :about
end
