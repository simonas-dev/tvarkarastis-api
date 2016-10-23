class HomeController < ApplicationController
  def index
  	@schools = School.all
  	@hash = Gmaps4rails.build_markers(@schools) do |school, marker|
		  marker.lat school.g_lat_lng.to_s.split(", ")[0]
		  marker.lng school.g_lat_lng.to_s.split(", ")[1]
		  marker.infowindow school.name + "<br>" + school.address
		end
  end
end
