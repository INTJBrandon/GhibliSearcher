class Cli
    def welcome
        puts ""
        puts "Welcome To The Ghibli Searcher!"
        self.ask_for_choice
    end

    def ask_for_choice
        puts "What would you like to search for?"
        puts "1. Films"
        puts "2. People"
        puts "3. Vehicles"
        input = gets.strip
        #  do something with choice
        input = input.to_i
        if input.is_a? String || input > 3 || input <= 0
            puts "Please enter a number shown on screen"
        else
            input -= 1
        end
        Api.request(input)
        if input == 0
            self.movies
        elsif input == 1
            self.characters
        elsif input == 2
            self.vehicles
        end
    end

    def movies
        puts "~~ Studio Ghibli Film Searcher ~~"
        puts "Please select a film you'd like to view information for" + "\n\n"
        Film.all.each_with_index do |movie, index|
            puts "#{index + 1}: #{movie.title}"
        end
        puts "\n"
        input = gets.strip
        input = input.to_i
        if input.is_a? String || input > Film.all.length || input <= 0
            puts "Please enter a number shown on screen"
        else
            input -= 1
        end
        movie_detail(input)
    end

    def movie_detail(choice)
        movie_choice = Film.all[choice]
        puts "\n"
        puts "Title of Movie: #{movie_choice.title}"
        puts "Description: #{movie_choice.description}"
        puts "Director: #{movie_choice.director}"
        puts "Producer: #{movie_choice.producer}"
        puts "Release Date: #{movie_choice.release_date}"
        puts "Rotten Tomato Score: #{movie_choice.rotten_score}%"
        puts "\n"
        puts "Would you like to go back to the previous list?"
        puts "1: Yes"
        puts "2: Exit"
        input = gets.strip
        if input == "1"
            self.movies
        elsif input == "2"
            exit
        end
    end
    def characters
        puts "~~ Studio Ghibli Character Searcher ~~"
        puts "Please select a character you'd like to view information for" + "\n\n"
        Character.all.each_with_index do |char, index|
            puts "#{index + 1}: #{char.name}"
        end
        puts "\n"
        input = gets.strip
        input = input.to_i
        if input.is_a? String || input > Character.all.length || input <= 0
            puts "Please enter a number shown on screen"
        else
            input -= 1
        end
        self.character_detail(input)
    end

    def character_detail(choice)
        character_choice = Character.all[choice]
        puts "~~ Studio Ghibli Vehicle Searcher ~~"
        puts "Name: #{character_choice.name}"
        puts "Gender: #{character_choice.gender}"
        puts "age: #{character_choice.age}"
        puts "Eye Color: #{character_choice.eye_color}"
        puts "Hair Color: #{character_choice.hair_color}"
        puts "Film Appeared In: #{character_choice.film}"
        puts "\n"
        puts "Would you like to go back to the previous list?"
        puts "1: Yes"
        puts "2: Exit"
        input = gets.strip
        if input == "1"
            self.characters
        elsif input == "2"
            exit
        end
    end
    def vehicles
        puts "~~ Studio Ghibli Vehicle Searcher ~~"
        puts "Please select a vehicle you'd like to view information for" + "\n\n"
        Vehicle.all.each_with_index do |vehicle, index|
            puts "#{index + 1}: #{vehicle.name}"
        end
        puts "\n"
        input = gets.strip
        input = input.to_i
        if input.is_a? String || input > Vehicle.all.length || input <= 0
            puts "Please enter a number shown on screen"
        else
            input -= 1
        end
        self.vehicle_detail(input)
    end
    def vehicles_detail
        puts "~~ Studio Ghibli character Searcher ~~"
        puts "Name: #{choice.name}"
        puts "Description: #{choice.description}"
        puts "Vehicle Class: #{choice.class}"
        puts "Size: #{choice.length} FT"
        puts "Pilot: #{choice.pilot}"
        puts "Film Appeared In: #{choice.film}"
    end


end