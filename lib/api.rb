class Api
    @@choices = ['films', 'people', 'vehicles']
    

    def self.request(num)
        url = "https://ghibliapi.herokuapp.com/#{@@choices[num]}"
        response = HTTParty.get(url)
        if num == 0
            film_hash = {
                title: response[0]["title"], description: response[0]["description"], director: response[0]["director"], producer: response[0]["producer"], release_date: response[0]["release_date"], rotten_score: response[0]["rt_score"]
            }
            Film.new(film_hash)
        elsif
            num == 1
            f_response = response[0]["films"][0]
            film_appeared = HTTParty.get(f_response)

            character_hash = { name: response[0]["name"], gender: response[0]["gender"], age: response[0]["age"], eye_color: response[0]["eye_color"], hair_color: response[0]["hair_color"], film: film_appeared["title"]
            }
            binding.pry
            Character.new(character_hash)
        end
    end
end