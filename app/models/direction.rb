class Direction

  require 'open-uri'
  require 'json'

  attr_accessor :start
  attr_accessor :destination

  def return_directions

    google_maps_url = URI.encode("http://maps.googleapis.com/maps/api/geocode/json?address=#{self.start}&sensor=false")
    string_data = open(google_maps_url).read
    data = JSON.parse(string_data)

    latitude = data['results'].first['geometry']['location']['lat']
    longitude = data['results'].first['geometry']['location']['lng']

    start_coordinates = [latitude, longitude]

    google_maps_url = URI.encode("http://maps.googleapis.com/maps/api/geocode/json?address=#{self.destination}&sensor=false")
    string_data = open(google_maps_url).read
    data = JSON.parse(string_data)

    latitude = data['results'].first['geometry']['location']['lat']
    longitude = data['results'].first['geometry']['location']['lng']

    destination_coordinates = [latitude, longitude]

    time = Time.now.to_i

    url = URI.encode("http://maps.googleapis.com/maps/api/directions/json?origin=#{start_coordinates[0]},#{start_coordinates[1]}&destination=#{destination_coordinates[0]},#{destination_coordinates[1]}&mode=transit&departure_time=#{time}&sensor=false")
    string = open(url).read
    hash = JSON.parse(string)

    transit_array = []
    info_hash = Hash.new
    info_hash['arrival_time'] = hash['routes'][0]['legs'][0]['arrival_time']['text']
    info_hash['departure_time'] = hash['routes'][0]['legs'][0]['departure_time']['text']
    info_hash['distance'] = hash['routes'][0]['legs'][0]['distance']['text']
    info_hash['duration'] = hash['routes'][0]['legs'][0]['duration']['text']
    info_hash['end_address'] = hash['routes'][0]['legs'][0]['end_address']
    info_hash['start_address'] = hash['routes'][0]['legs'][0]['start_address']

    hash['routes'][0]['legs'][0]['steps'].each do |step|
      if step['travel_mode'] == 'TRANSIT'
        transit_array << step
      end
    end
    steps = Array.new
    transit_array.each do |route|
      route_hash = Hash.new
      route_hash['arrival_stop'] = route['transit_details']['arrival_stop']['name']
      route_hash['departure_stop'] = route['transit_details']['departure_stop']['name']
      steps << route_hash
    end

    info_hash['instructions'] = steps

    return info_hash

  end
end
