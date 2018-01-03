class ApiController < ApplicationController

  def index

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

  private

  def getLatLng (school)
    lat_lng =  school.g_lat_lng.to_s.split(", ")
    return { 'lat': lat_lng[0], 'lng': lat_lng[1] }
  end

end