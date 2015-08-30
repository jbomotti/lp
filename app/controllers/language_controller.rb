get '/languages' do
  @languages = Language.all
  erb :'languages/index'
end

get '/languages/new' do
  @language = Language.new
  erb :'languages/new'
end

get '/languages/delete/:id' do
  @language = Language.find(params[:id])
  erb :'languages/destroy'
end

delete '/languages/destroy' do
  language = Language.find(params[:language_id])
  language.destroy
  redirect '/languages'
end

post '/languages' do
  @language = Language.new

  @language.name = params[:name]

  if @language.save
    redirect "/languages/#{@language.id}"
  else
    erb :'languages/new'
  end
end

get '/languages/:id' do
  @language = Language.find(params[:id])
  erb :'languages/show'
end

get '/languages/:id/add' do
  @language = Language.find(params[:id])
  add_language(@language)
  redirect back
end

get '/languages/:id/delete' do
  @language = Language.find(params[:id])
  remove_language(@language)
  redirect back
end
