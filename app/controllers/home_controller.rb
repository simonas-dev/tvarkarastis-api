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

  def get_all
    render json: School.all
  end

  def get_in_dist
    schools = []
    if params[:dist]
      dist = params[:dist].to_f
    else
      dist = 9999999999
    end
    q_lat = params[:lat].to_f
    q_lng = params[:lng].to_f

    School.all.each do |a|
      loc = getLatLng(a)
      calc = Geocoder::Calculations.distance_between([loc[:lat], loc[:lng]], [q_lat, q_lng], :units => :km)
      if calc < dist
        a = a.attributes
        a = a.merge({"distance": calc})
        puts(a)
        schools.push(a)
      end
    end
    render json: schools
  end

  def getLatLng (school)
    lat_lng =  school.g_lat_lng.to_s.split(", ")
    return { 'lat': lat_lng[0], 'lng': lat_lng[1] }
  end
end
