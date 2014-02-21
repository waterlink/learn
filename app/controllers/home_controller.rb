class HomeController < ApplicationController
  def index
    @presentations = Presentation.all
  end
end
