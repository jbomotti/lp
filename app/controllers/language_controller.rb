get '/languages' do
  @languages = Language.all
  erb :'languages/index'
end

get '/languages/tester' do
  @language = Language.find(1)
  erb :'languages/_tester', :locals => {:language => @language }
end

get '/languages/new' do
  @language = Language.new
  if request.xhr? ## AKA, is this AJAX?
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
    if request.xhr? ## Is AJAX?
      erb :'languages/_item', :layout => false, :locals => {:language => @language }
    else
      redirect "/languages/#{@language.id}"
    end
  else ## If save fails...
    if request.xhr? ## Another AJAX check to return to fancy form
      halt 400, erb(:'languages/_form', :layout => false, :locals => {:language => @language })
    else
      erb :'languages/new'
    end
  end
end

get '/languages/:id' do
  @language = Language.find(params[:id])
  erb :'languages/show'
end

get '/languages/:id/add' do
  @language = Language.find(params[:id])
  add_language(@language)
  if request.xhr?
    erb :'languages/_remove_button', layout: false, locals: {language: @language}
  else
    redirect back
  end
end

get '/languages/:id/delete' do
  @language = Language.find(params[:id])
  remove_language(@language)
  if request.xhr?
    erb :'languages/_add_button', layout: false, locals: {language: @language}
  else
    redirect back
  end
end
