class RaceController < ApplicationController

    get '/races' do 
        if !logged_in?
            redirect to '/'
        else
            current_user
            erb :'users/homepage'
        end
    end

    get '/races/new' do 
        if !logged_in?
            redirect to '/login'
        else
            @user = current_user
            erb :'races/new'
        end
    end

    post '/races' do 
        if logged_in?
            if params[:name] == ""
                redirect to '/races/new'
            else
                @race = Race.new(params)
                if @race.save
                    current_user.races << @race 
                    current_user.save
                    redirect to "/races/#{@race.id}"
                else 
                    redirect to '/race/new'
                end
            end
        else
            redirect to '/login'
        end
    end

    get '/races/:id' do 
        if logged_in?
            @race = Race.find_by_id(params[:id])
            erb :'races/show_race'
        else
            redirect to '/login'
        end
    end

end