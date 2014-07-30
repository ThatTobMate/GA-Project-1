class PicturesController < ApplicationController

  def index
    @album = Album.find(params[:album_id])
    @pictures = @album.pictures
  end

  def show


    @picture = Picture.find(params[:id])
  end

  def new

    @profile = current_user.profile
    @album = Album.find(params[:album_id])
    @picture = Picture.new


  end

  # GET /songs/1/edit
  def edit
    @profile = current_user.profile
    @album = Album.find(params[:album_id])
    @picture = Picture.find(params[:id])
  end

  def create

    @profile = current_user.profile

    @picture = Picture.new(params[:picture])

    respond_to do |format|
      if @picture.save
        format.html { redirect_to profile_album_picture_path(@picture.id, {profile_id: @picture.album.profile.id, album_id: @picture.album.id })}
        format.json { render json: @picture, status: :created, location: @picture }
      else
        format.html { render action: "new" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @picture = Picture.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to profile_album_picture_path(@picture.id, {profile_id: @picture.album.profile.id, album_id: @picture.album.id })}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end
end