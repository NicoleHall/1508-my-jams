class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update]

  def index
    @songs = Song.where(title: @search_term)
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    # Song.create(song_params)
    # redirect_to songs_path

    @song = Song.new(song_params)
    if @song.save
      flash[:notice] = "Song successfully saved."
      redirect_to songs_path
    else
      flash.now[:errors] = "Do it right!"
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to @song
    else
      flash.now[:errors] = @song.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    # song = Song.find(params[:id])
    # song.destroy

    Song.destroy(params[:id])
    redirect_to songs_path
  end

  private

  def set_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :artist)
  end
end