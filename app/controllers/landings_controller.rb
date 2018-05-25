# gateway to application
class LandingsController < ApplicationController
  # GET '/wew44r'
  def show
    shortener = Url.find_by(slug: params[:id])
    # redirect if root called with shortener slug
    redirect_to shortener.url unless shortener.nil?
  end

  # POST '/'
  # Params: url string
  def create
    @url = Url.where(url: params[:url]).first_or_create
    unless @url.valid?
      flash[:notice] = @url.errors.full_messages.join(', ')
      redirect_to root_path
    end
    @shortended_url = "#{http_host}/#{@url.slug}"
  end

  private

  def http_host
    current_host = request.protocol + request.host
    current_host += ':' + request.port.to_s if request.port.present?
    current_host
  end
end
