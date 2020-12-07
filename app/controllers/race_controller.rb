class RaceController < ApplicationController

    get '/races/new' do 
        erb :'races/new'
    end
end