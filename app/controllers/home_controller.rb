class HomeController < ApplicationController
  def index
  	@schools = School.all
  	@hash = Gmaps4rails.build_markers(@schools) do |school, marker|
		  marker.lat school.g_lat_lng.to_s.split(", ")[0]
		  marker.lng school.g_lat_lng.to_s.split(", ")[1]

		  info_comp = {}
		  info_comp['name'] = "<p>" + school.name + "</p>"
		  info_comp['address'] = "<p>" + school.address + "</p>" 
			info_comp['g_place_id'] = school.g_place_id ? "<p>" + school.g_place_id + "</p>"  : "<p>" + "null" + "</p>" 
			info_comp['web'] = school.web ? "<a href=" + school.web + ">" + school.web + "</a>" : "null"

		  marker.infowindow info_comp['name'] + info_comp['address'] + info_comp['g_place_id'] + info_comp['web']
 		end
  end
end
