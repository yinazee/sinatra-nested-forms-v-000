require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/pirates' do
      @pirates = Pirate.all

      erb :'pirates/index'
    end

    get '/pirates/:id' do #'/:id' is known as the dynamic segment
      @pirate = Pirate.find(params[:id])

      erb :'pirates/show'
    end

    get '/pirates/new' do #don't do just /new, be specific because in this app there's pirate and ships

      erb :'pirates/new'
    end
  end
end
