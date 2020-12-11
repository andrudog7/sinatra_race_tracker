class UserController < ApplicationController
  
  get "/signup" do 
    if !logged_in?
        erb :'/users/signup' 
    else 
        redirect to '/users/:slug'
    end
  end

  post '/signup' do 
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    elsif User.all.map{|user|user.email}.include?(params[:email])
        flash[:email] = "Sorry, #{params[:email]} is already being used.  Please use a different email address."
        redirect to '/signup'
    elsif User.all.map{|user|user.username}.include?(params[:username])
        flash[:username] = "Sorry, the username #{params[:username]} is already taken.  Please choose a different username."
        redirect to '/signup'
    else
      @user = User.new(params)
      @user.save
      session[:user_id] = @user.id
      erb :'/users/homepage'
    end
  end

  get '/login' do
    if !logged_in?
        erb :'users/login'
    else
        erb :'users/homepage'
    end
  end

  post '/login' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect to "/users/#{@user.slug}"
        else
            redirect to '/signup'
        end
  end

  get "/users/:slug" do
    erb :'users/homepage'
  end

  get '/logout' do 
    if logged_in?
        session.destroy
        redirect to '/'
    else
        redirect to '/'
    end
  end

end