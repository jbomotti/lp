get '/pair/notify' do
  @user = auth_current_user
  @pair = User.find(params[:pair])
  @language = Language.find(params[:lang_id])
  send_twilio_pairing(@user, @pair, @language)
  redirect back
end

get '/pair/:id' do
  @pair = User.find(params[:id])
  @user = auth_current_user
  @language = Language.find(params[:lang_id])
  erb :'pair/index'
end
