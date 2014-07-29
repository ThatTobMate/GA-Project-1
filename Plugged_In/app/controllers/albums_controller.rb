class AlbumsController < ApplicationController


  def index
    @profile = Profile.find(params[:profile_id])

    @albums = @profile.albums
  end

  def show


    @album = Album.find(params[:id])
  end

  def new
    @album = Album.new
  end

  # GET /songs/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  def create
    @album = Album.new(params[:album])

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @album, notice: 'Picture was successfully created.' }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:album])
        format.html { redirect_to @album, notice: 'album was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to albums_url }
      format.json { head :no_content }
    end
  end
end