# gateway to application
class LandingsController < ApplicationController
  # GET '/wew44r'
  def show
    shortener = Url.find_by(slug: params[:id])
    if shortener.nil?
      render text: 'Invalid entry'
    else
      redirect_to shortener.url
    end
  end

  # POST '/'
  # Params: url string
  def create
    url = Url.where(url: params[:url]).first_or_create
    if url.valid?
      render text: "#{http_host}/#{url.slug}"
    else
      render text: 'Error: ' + url.errors.full_messages.join(', ')
    end
  end

  private

  def http_host
    current_host = request.protocol + request.host
    current_host += ':' + request.port.to_s if request.port.present?
    current_host
  end
end
