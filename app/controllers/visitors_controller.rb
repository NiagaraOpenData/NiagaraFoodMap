class VisitorsController < ApplicationController

  def index
    @foodbanks = Gmaps4rails.build_markers(Foodbank.all) do |foodbank, marker|
      marker.lat foodbank.latitude
      marker.lng foodbank.longitude
      marker.infowindow "<h4>#{foodbank.info['Name']}</h4> <p><h5>Description</h5><p>#{foodbank.info['Description (Service)']}</p> <h5>Hours</h5><p>#{foodbank.info['Hours']}</p> <h5>Address</h5><p>#{foodbank.info['Address']}</p>"
    end
  end
end
