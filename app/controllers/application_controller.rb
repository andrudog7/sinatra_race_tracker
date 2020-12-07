require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'rt_secret'
    set :views, Proc.new { File.join(root, "../views/") }
  end

  get "/" do
    erb :welcome
  end

  get "/signup" do 
    erb :signup
  end

  post '/signup' do 
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to 'signup'
    else
      @user = User.new(params)
      session[:user_id] = @user.id
      @user.save
      erb :'/users/homepage'
    end
  end

end
