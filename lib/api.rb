class Api
    @@choices = ['films', 'people', 'vehicles']
    

    def self.request(num)
        url = "https://ghibliapi.herokuapp.com/#{@@choices[num]}"
        response = HTTParty.get(url)
        if num == 0
            response.map do |movie|
            film_hash = {
                title: movie["title"], description: movie["description"], director: movie["director"], producer: movie["producer"], release_date: movie["release_date"], rotten_score: movie["rt_score"]
            }
            Film.new(film_hash)
            end 
        elsif num == 1
            response.map do |character|
                f_response = character["films"][0]
                film_appeared = HTTParty.get(f_response)
                character_hash = { name: character["name"], gender: character["gender"], age: character["age"], eye_color: character["eye_color"], hair_color: character[0]["hair_color"], film: film_appeared["title"]
                }
                Character.new(character_hash)
            end
        elsif num == 2
            response.map do |vehicle|
                f_response = vehicle["films"]
                film_appeared = HTTParty.get(f_response)
                p_response = vehicle["pilot"]
                vehicle_pilot = HTTParty.get(p_response)

                vehicle_hash = {name: vehicle["name"], description: vehicle["description"], class: vehicle["vehicle_class"], length: vehicle["length"], pilot: vehicle_pilot["name"], film: film_appeared["title"]}
                Vehicle.new(vehicle_hash)
            end
        end
    end
end