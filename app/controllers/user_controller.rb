class UserController < ApplicationController
	def index
		@users = User.all
	end

	def get
		@user = User.find_by(device_id: params[:id])
		@footsteps = Footstep.where(user_id: @user.id).last(50)
		
		@hash = Gmaps4rails.build_markers(@footsteps) do |footstep, marker|
      marker.lat footstep.g_lat_lng.to_s.split(",")[0]
      marker.lng footstep.g_lat_lng.to_s.split(",")[1]

      info_comp = {}
      info_comp['timestamp'] = "<p>" + footstep.created_at.to_s + "</p>"

      marker.infowindow info_comp['timestamp']
    end

	end
end