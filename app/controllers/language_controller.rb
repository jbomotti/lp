get '/languages' do
  @languages = Language.all
  erb :'languages/index'
end

get '/languages/new' do
  @language = Language.new
  if request.xhr?
    erb :'languages/_form', :layout => false, :locals => {:language => @language }
  else
    erb :'languages/new'
  end
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
    if request.xhr?
      erb :'languages/_item', :layout => false, :locals => {:language => @language }
    else
      flash[:message] = 'Language Added!'
      redirect "/languages/#{@language.id}"
    end
  else
    if request.xhr?
      halt 400, erb(:'languages/_form', :layout => false, :locals => {:language => @language })
    else
      erb :'languages/new'
    end
  end
  #   redirect "/languages/#{@language.id}"
  # else
  #   erb :'languages/new'
  # end
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
