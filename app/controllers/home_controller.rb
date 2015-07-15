class HomeController < ApplicationController
  def index
    @twott = Twott.new
    @twott.twitter
  end
end
