class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end
    
  get '/artists/:slug' do
      @artist = Artist.find_by_slug(params[:slug])
      erb :'artists/show'
  end

  get '/genres' do
    @genres = Genre.all
    erb :'./genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end

  get '/songs' do
      @songs = Song.all
      erb :'songs/index'
  end

  get '/songs/new' do
      erb :'songs/new'
  end

  post '/songs' do
      @song = Song.create(params[:song])
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      @song.genre_ids = params[:genres]
      @song.save
      redirect("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      erb :'songs/show'
  end

end
