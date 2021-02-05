class Api
    @@choices = ['films', 'people', 'vehicles']
    

    def self.request(num)
        url = "https://ghibliapi.herokuapp.com/#{@@choices[num]}"
        response = HTTParty.get(url)
        if num == 0
            film_hash = {}
            response.map do |movie|
            film_hash = {
                title: movie["title"], description: movie["description"], director: movie["director"], producer: movie["producer"], release_date: movie["release_date"], rotten_score: movie["rt_score"]
            }
            Film.new(film_hash)
            end 
        elsif num == 1
            f_response = response[0]["films"][0]
            film_appeared = HTTParty.get(f_response)

            character_hash = { name: response[0]["name"], gender: response[0]["gender"], age: response[0]["age"], eye_color: response[0]["eye_color"], hair_color: response[0]["hair_color"], film: film_appeared["title"]
            }
            Character.new(character_hash)
        elsif num == 2
            f_response = response[0]["films"]
            film_appeared = HTTParty.get(f_response)
            p_response = response[0]["pilot"]
            vehicle_pilot = HTTParty.get(p_response)

            vehicle_hash = {name: response[0]["name"], description: response[0]["description"], class: response[0]["vehicle_class"], length: response[0]["length"], pilot: vehicle_pilot["name"], film: film_appeared["title"]}

            Vehicle.new(vehicle_hash)
        end
    end
end