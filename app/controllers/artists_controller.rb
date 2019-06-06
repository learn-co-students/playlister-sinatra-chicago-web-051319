class ArtistsController < ApplicationController

  get "/artists" do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug_name' do
    @artist = Artist.find_by_slug(params[:slug_name])
    erb :'/artists/show'
  end

  post '/artists/:slug_name' do
    @artist = Artist.find_by_slug(params[:slug_name])
    redirect '/artists/show'
  end



end
