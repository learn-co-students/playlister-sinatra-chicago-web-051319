require 'pry'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
    # binding.pry
  end

  get '/songs/:id' do
  @song_by_id = Song.find_by_id(params[self.slug])

  erb :show
end

end
