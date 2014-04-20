class HomeController < ApplicationController
  def index
    @presentations = Presentation.all
  end

  def to
    @url = params[:url]
  end
end
