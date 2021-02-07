class Film
    attr_accessor :title, :description, :director, :producer, :release_date, :rotten_score 
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
end