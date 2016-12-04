class FootstepController < ApplicationController
	def create
		device_id = params[:device_id]
		g_lat_lng = params[:g_lat_lng]
		user_id = 0
		
		user = User.where(device_id: device_id).last
		
		if not user
			user = User.new
			user.device_id = device_id
			user.save
		end

		footstep = Footstep.new
		footstep.g_lat_lng = g_lat_lng
		footstep.user_id = user.id
		footstep.save

		render json: footstep
	end
end