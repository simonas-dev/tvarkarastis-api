
json = ActiveSupport::JSON.decode(File.read('db/seeds/schools.json'))

json.each do |a|
  school = School.new()
  if School.find_by(code: a['kodas'])
		school = School.find_by(code: a['kodas'])
  end
  
  puts a['kodas'] 

	school.code = a['kodas']
	school.name = a['geltoni']['name']
	school.web = a['geltoni']['web']

	if a['geocode'] != {}
		school.address = a['geocode']['query']
		school.g_place_id = a['geocode']['place_id']
		lat_s = a['geocode']['location']['lat'].to_s
		lng_s = a['geocode']['location']['lng'].to_s
		school.g_lat_lng = lat_s + ", " + lng_s
	else
		school.address = a['geltoni']['location']['address'] + ", " + a['geltoni']['location']['post_code']
	end
	
	puts school.to_json

  school.save
end