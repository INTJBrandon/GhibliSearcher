class Api
    @@url = "https://ghibliapi.herokuapp.com/films"

    def self.request
        response = HTTParty.get(@@url)
        binding.pry
    end
end