class RaceController < ApplicationController

    get '/races' do 
        if !logged_in?
            redirect to '/'
        else
            current_user
            erb :'users/homepage'
        end
    end

    get '/races/all_races' do 
        if !logged_in?
            redirect to '/'
        else
            current_user
            erb :'users/all_races'
        end
    end

    get '/races/new' do 
        if !logged_in?
            redirect to '/login'
        else
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
                    redirect to "/races/#{@race.slug}/show"
                else 
                    redirect to '/race/new'
                end
            end
        else
            redirect to '/login'
        end
    end

    get '/races/:distance' do 
        if logged_in?
            distance = params[:distance]
            @distance = distance.gsub("_", "-")
            erb :"/users/distance_layouts"
        else
            redirect to '/login'
        end
      end

    get '/races/:slug/show' do 
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

    patch '/races/:slug' do 
        if logged_in?
            if params[:name] == ""
                redirect to "/races/#{params[:id]}/edit"
            else
                @race = Race.find_by_slug(params[:slug])
                if @race && @race.user == current_user
                    if @race.update(name: params[:name], location: params[:location], distance: params[:distance], finish_time: params[:finish_time], pace: params[:pace], date: params[:date])
                        redirect to "/races/#{@race.slug}/show"
                    else
                        redirect to "/races/#{params[:slug]}/edit"
                    end
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
            redirect to "/races/#{race.slug_distance}"
        else
            redirect to '/login'
        end
    end

end