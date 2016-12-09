class SeedFootsteps
	
	def self.run()
		json = ActiveSupport::JSON.decode(File.read('db/seeds/footstep_dump.json'))
		user_id = 4
		footstep_list = []

		Footstep.destroy_all

		json.each do |a|

			footstep = {
				g_lat_lng: a['latLng'],
				user_id: user_id
			}
			
			footstep_list.push(footstep)
		end

		Footstep.create(footstep_list)

		puts Footstep.count
	end
end