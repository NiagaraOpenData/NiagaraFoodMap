class VisitorsController < ApplicationController

  def index
    @foodbanks = Gmaps4rails.build_markers(Foodbank.all) do |foodbank, marker|
      marker.lat foodbank.latitude
      marker.lng foodbank.longitude
      marker.infowindow foodbank.info['Name']
    end
  end
end
