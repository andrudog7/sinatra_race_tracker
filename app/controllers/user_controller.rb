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
      redirect to 'signup'
    else
      @user = User.new(params)
      @user.save
      session[:user_id] = @user.id
      binding.pry
      erb :'/users/homepage'
    end
  end

  get '/login' do
    if !logged_in?
        erb :'users/login'
    else
        @user = current_user
        redirect to "/users/#{@user.slug}"
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
    @user = User.find_by_slug(params[:slug])
    erb :'users/homepage'
  end

  get '/logout' do 
    if logged_in?
        session.destroy
        redirect to '/login'
    else
        redirect to '/'
    end
  end

end