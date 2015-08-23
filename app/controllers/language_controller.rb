get '/languages' do
  @languages = Language.all
  erb :'languages/index'
end
