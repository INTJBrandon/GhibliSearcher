class Film
    attr_accessor :title, :description, :director, :producer, :release_date, :rotten_score
    @@all = []
    def initialize(hash)
        hash.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
            @@all << self
        end
    end

    def self.all
        @@all
    end
    
    def self.reset
        @@all.clear
    end
end