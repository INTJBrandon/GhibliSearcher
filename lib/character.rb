class Character
    attr_accessor :name, :gender, :age, :eye_color, :hair_color, :film
    @@all = []
    def initialize(hash)
        hash.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
        @@all << self
    end

    def self.all
        @@all
    end

    def self.reset
        @@all.clear
    end
end