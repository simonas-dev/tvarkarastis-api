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

  def get_schools
  	schools = []
  	dist = params[:dist]
  	q_lat = params[:lat]
  	q_lng = params[:lng]

  	School.all.each do |a|
  		loc = getLatLng(a)
  		calc = Geocoder::Calculations.distance_between([loc[:lat], loc[:lng]], [q_lat, q_lng], :units => :km)
  		if calc < dist
				schools.push(a)
				puts a.name
				puts calc
  		end
  	end
  	render json: schools
  end

  def getLatLng (school)
  	lat_lng =  school.g_lat_lng.to_s.split(", ")
  	return { 'lat': lat_lng[0], 'lng': lat_lng[1] }
  end
end
