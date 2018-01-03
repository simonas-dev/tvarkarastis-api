class HomeController < ApplicationController
  
  def index
    search_q = params[:search_q]
    if search_q
      @schools = School.where(is_hidden: false).where("name like ?", "%" + search_q + "%")
    else
      @schools = School.where(is_hidden: false)
    end
  
    @hash = Gmaps4rails.build_markers(@schools) do |school, marker|
      marker.lat school.g_lat_lng.to_s.split(", ")[0]
      marker.lng school.g_lat_lng.to_s.split(", ")[1]

      marker.infowindow(
        '<p>' +
        '<div>' + school.name + '</div>' +
        '<div>' + school.school_type + '</div>' +
        '<div>' + school.address + '</div>' +
        '<div>' + school.g_lat_lng + '</div>' +
        (school.web ? '<a href=' + school.web + '>' + school.web + '</a>' : 'null') + '<br>' +
        '<br>' +
        '<a class="btn-sm btn-dark" href="/school/' + school.id.to_s + '">Edit</a>  ' +
        '<a class="btn-sm btn-dark" href="/school/' + school.id.to_s + '/hide">Hide</a>  ' +
        '<a class="btn-sm btn-danger" href="/school/' + school.id.to_s + '/delete">Delete</a> ' +
        '</p>'

      )
    end
  end
  
end
