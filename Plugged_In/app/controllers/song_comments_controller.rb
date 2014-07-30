class SongCommentsController < ApplicationController
  def index
  end

  def create
    @comment = SongComment.new(params[:song_comment])
  end
  def index
    @comment = SongComment.find(params[:song_comment_id])
  end

  def show

    @comment = SongComment.find(params[:id])
  end

  def new
    @comment = SongComment.new

  end

  # GET /songs/1/edit
  def edit
    @comment = SongComment.find(params[:id])
  end

  def create
    @comment = SongComment.new(params[:song_comment])
  end

  def update
    @comment = SongComment.find(params[:id])

  end

  def destroy
    @comment = SongComment.find(params[:id])
    @comment.destroy
  end
end
