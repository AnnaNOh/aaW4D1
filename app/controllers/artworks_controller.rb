class ArtworksController < ApplicationController

  def index
    user = User.find(params[:user_id])

    render json:
    { art_work: Artwork.where(artist_id: params[:user_id]),
    shared: user.shared_artworks }
    
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    if artwork
      render json: artwork
    else
      render json: artwork.errors.full_messages
    end
  end

  def update
    artwork = Artwork.find(params[:id])
    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages
    end
  end

  def destroy
    artwork = Artwork.find(params[:id])
    if artwork.destroy
      render json: artwork
    else
      render json: artwork.errors.full_messages
    end
  end

private

  def artwork_params
    params.require(:artworks).permit(:title, :artist_id, :image_url)
  end

end
