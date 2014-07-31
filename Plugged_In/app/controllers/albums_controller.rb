class AlbumsController < ApplicationController
  before_filter :authenticate_user!, only: :index

  def index
    @profile = Profile.find(params[:profile_id])

    @albums = @profile.albums
  end

  def show
  @profile = Profile.find(params[:profile_id])    

    @album = Album.find(params[:id])
  end

  def new
    @profile = current_user.profile

    @album = Album.new
  end

  # GET /songs/1/edit
  def edit
    @profile = current_user.profile
    @album = Album.find(params[:id])
    # authorize! :update, @album
  end

  def create
    @profile = current_user.profile

    @album = Album.new(params[:album])


    respond_to do |format|
      if @album.save
        format.html { redirect_to [@profile, @album], notice: 'Album was successfully created.' }
        format.json { render json: @album, status: :created, location: @album }
      else
        format.html { render action: "new" }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @album = Album.find(params[:id])
    @profile = Profile.find(params[:profile_id])
    #authorize! :update, @album

    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to profile_album_path(@profile,@album), notice: 'album was successfully updated.' }
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
