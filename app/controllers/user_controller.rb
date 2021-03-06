get '/register' do
  @user = User.new
  erb :'users/register'
end

post '/register' do
  @user = User.new
  @user.first_name = params[:first_name]
  @user.last_name = params[:last_name]
  @user.email = params[:email]
  @user.username = params[:username]
  @user.password = params[:password]

  if @user.save
    auth_login(@user)
    flash[:message] = 'Thank you for registering'
    redirect '/profile'
  else
    @form_error = 'Unable to register you '
    erb :'users/register'
  end
end

get '/login' do
  @username = ''
  erb :'users/login'
end

post '/login' do
  @username = params[:username]
  user = User.find_by(:username => @username)

  if (user && user.password == params[:password])
    auth_login(user)
    redirect '/profile'
  else
    @form_error = 'We were unable to log you in'
    erb :'users/login'
  end
end

get '/profile' do
  # redirect '/' unless auth_logged_in?
  if auth_logged_in?
    @user = auth_current_user
    @languages = @user.languages
    erb :'users/profile'
  else
    @languages = top_languages
    erb :home
  end
end

get '/edit' do
  @user = auth_current_user
  erb :'users/edit'
end

post '/edit' do
  @user = auth_current_user
  @user.first_name = params[:first_name]
  @user.last_name = params[:last_name]
  @user.email = params[:email]
  # @user.password = params[:password] unless params[:password] == ""
  if @user.save
    flash[:message] = 'Thank you for updating your info'
    redirect '/profile'
  else
    @form_error = 'Unable to register your changes'
    erb :'users/edit'
  end
end

get '/logout' do
  auth_logout
  flash[:message] = 'Thanks for playing!'
  redirect '/'
end
