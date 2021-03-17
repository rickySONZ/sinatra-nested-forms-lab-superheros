require 'pry'
require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
        erb :super_hero
    end 

    post '/teams' do
        
      
        @team = Team.new(params[:team][:name], params[:team][:motto])
        @hero_name = []
        @hero_power = []
        @hero_bio = []
        @team_members = params[:team][:members]
        
        @team_members.each do |details|
            
            @hero_name << details[:name]
            @hero_power << details[:power]
            @hero_bio << details[:bio]
        end
        
        #@superheroes = SuperHero.all
        
        erb :team
    end


end
