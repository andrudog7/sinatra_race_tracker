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
                    redirect to "/races/#{@race.slug}"
                else 
                    redirect to '/race/new'
                end
            end
        else
            redirect to '/login'
        end
    end

    get '/races/:slug' do 
        if logged_in?
            @race = Race.find_by_slug(params[:slug])
            erb :'races/show_race'
        else
            redirect to '/login'
        end
    end

    get '/races/:slug/edit' do 
        if logged_in?
            @race = Race.find_by_slug(params[:slug])
            if @race && @race.user == current_user
                erb :'/races/edit_race'
            else
                redirect to '/users/homepage'
            end
        else
            redirect to '/login'
        end
    end

    patch '/races/:id' do 
        if logged_in?
            if params[:name] == ""
                redirect to "/races/#{params[:id]}/edit"
            else
                @race = Race.find_by_id(params[:id])
                if @race && @race.user == current_user
                    if @race.update(name: params[:name], location: params[:location], distance: params[:distance], finish_time: params[:finish_time], pace: params[:pace])
                        redirect to "/races/#{@race.id}"
                    else
                        redirect to "/races/#{params[:id]}/edit"
                    end
                else
                    redirect to '/races'
                end
            end
        else
            redirect to '/login'
        end
    end

    delete '/races/:id/delete' do 
        race = Race.find_by_id(params[:id])
        if logged_in? && race.user == current_user
            race.delete
            redirect to "/users/#{race.user.id}"
        else
            redirect to '/login'
        end
    end

end