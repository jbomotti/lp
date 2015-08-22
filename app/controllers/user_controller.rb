get '/register' do
  @user = User.new
  erb :'users/register'
end
