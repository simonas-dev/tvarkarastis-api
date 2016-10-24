
json = ActiveSupport::JSON.decode(File.read('db/seeds/schools.json'))

school_list = []

json.each do |a|
  puts a['kodas'] 

	code = a['kodas']
	name = a['geltoni']['name']
	web = a['geltoni']['web']

	if a['geocode'] != {}
		address = a['geocode']['query']
		g_place_id = a['geocode']['place_id']
		lat_s = a['geocode']['location']['lat'].to_s
		lng_s = a['geocode']['location']['lng'].to_s
		g_lat_lng = lat_s + ", " + lng_s
	else
		address = a['geltoni']['location']['address'] + ", " + a['geltoni']['location']['post_code']
	end

	school = {
		code: code,
		name: name,
		web: web,
		address: address,
		g_place_id: g_place_id,
		g_lat_lng: g_lat_lng
	}
	
	school_list.push(school)
end

School.create(school_list)