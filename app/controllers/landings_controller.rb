class LandingsController < ApplicationController

  # GET '/wew44r'
  def show
    shortener = Url.find_by(slug: params[:id])
    unless shortener.nil?
      redirect_to shortener.url
    else
      render text: 'Invalid entry'
    end

  end

  # POST '/'
  # Params: url string
  def create
    url = Url.where(url: params[:url]).first_or_create
    if url.valid?
      current_host = request.protocol + request.host
      current_host += ':' + request.port.to_s if request.port.present?
      render text:  "#{current_host}/#{url.slug}"
    else
      render text: 'Error: ' + url.errors.full_messages.join(', ')
    end
  end

end
