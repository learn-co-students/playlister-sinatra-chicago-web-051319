class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by_id(@song.artist_id)
    erb :'/songs/show'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    redirect '/songs/show'
  end




end
