require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/pirates' do
      @pirates = Pirate.all

      erb :'pirates/index'
    end

    get '/pirates/new' do #don't do just /new, be specific because in this app there's pirate and ships
      erb :'pirates/new'
    end

    get '/pirates/:id' do #'/:id' is known as the dynamic segment
      @pirate = Pirate.find(params[:id])

      erb :'pirates/show'
    end

    post '/pirates' do
      # binding.pry
      pirate = Pirate.new(name: params[:pirate][:name], height: params[:pirate][:height], weight: params[:pirate][:weight])
      params[:pirate][:ships].each do |ship_data|
        ship = Ship.new(ship_data)
        ship.pirate = pirate
        ship.save
      end
      # binding.pry
      redirect to "pirates/#{pirate.id}"
    end


  end
end
