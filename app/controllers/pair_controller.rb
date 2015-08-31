get '/pair/:id' do
  @pair = User.find(params[:id])
  @user = auth_current_user
  @language = Language.find(params[:lang_id])
  erb :'pair/index'
end
