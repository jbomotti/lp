helpers do

  def send_twilio_pairing(user, pair, language)
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.account.messages.create({:to => "+14152461132",
                                       :from => "+14156971132",
                                       :body => "Hello, #{pair.first_name}! #{user.fullname} would like to learn #{language.name} with you! Sign in to Language Pair now to get started!"})
  end
end
