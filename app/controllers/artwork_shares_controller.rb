class ArtworkSharesController < ApplicationController

  def index
    render json: ArtworkShare.all
  end

  def create
    artwork_share = ArtworkShare.new(artwork_share_params)
    if artwork_share.save
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork_share = ArtworkShare.find(params[:id])
    if artwork_share
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages
    end
  end

  def update
    artwork_share = ArtworkShare.find(params[:id])
    if artwork_share.update(artwork_share_params)
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages
    end
  end

  def destroy
    artwork_share = ArtworkShare.find(params[:id])
    if artwork_share.destroy
      render json: artwork_share
    else
      render json: artwork_share.errors.full_messages
    end
  end

private

  def artwork_share_params
    params.require(:artwork_shares).permit(:viewer_id, :artwork_id)
  end

end
