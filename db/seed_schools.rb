class SeedSchools
	def self.run()
		json = ActiveSupport::JSON.decode(File.read('db/seeds/schools_maps_lt.json'))

		school_list = []

		School.destroy_all

		puts School.count

		json.each do |a|
			code = a['kodas']
			school_type = a['type']
			contacts = a['contacts']
			name = a['geltoni']['name']
			web = a['geltoni']['web']

			if a['geocode'] != {}
				address = a['geocode']['query']
				g_place_id = a['geocode']['place_id']
			else
				address = a['geltoni']['location']['address'] + ", " + a['geltoni']['location']['post_code']
			end


			lat_s = a['mapslt']['location']['lat'].to_s
			lng_s = a['mapslt']['location']['lng'].to_s
			g_lat_lng = lat_s + ", " + lng_s
			
			school = {
				code: code,
				name: name,
				web: web,
				school_type: school_type,
				contacts: contacts,
				is_hidden: false,
				address: address,
				g_place_id: g_place_id,
				g_lat_lng: g_lat_lng
			}
			
			school_list.push(school)
		end

		School.create(school_list)

		puts School.count
	end

end