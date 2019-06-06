class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug_name' do
    @genre = Genre.find_by_slug(params[:slug_name])
    erb :'/genres/show'
  end

  post '/genres/:slug_name' do
    @genre = Genre.find_by_slug(params[:slug_name])
    redirect '/genres/show'
  end

end
