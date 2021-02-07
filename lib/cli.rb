class Cli
    @@all = []
    def welcome
        if @@all.empty?
            puts ""
            puts "Welcome To The Ghibli Searcher!"
            @@all << self
            self.ask_for_choice
        else
            puts ""
            puts "Welcome To The Ghibli Searcher!"
            self.ask_for_choice("That is not a valid choice. Please enter a number shown on screen!")
        end
    end

    def ask_for_choice(error_message="")
        puts "What would you like to search for or type exit to 'exit' the program!"
        puts "1: Films"
        puts "2: People"
        puts "3: Vehicles"
        puts error_message
        input = gets.strip
        if input.numeric?
            input = input.to_i
            if input > 3 || input <= 0
                self.welcome
            else
                input -= 1
            end
        elsif !input.numeric?
            input.downcase!
            if input == "exit"
                exit
            else
                self.welcome
            end
        end
        if input == 0
            Api.request(input) if Film.all.empty?
            self.movies
        elsif input == 1
            Api.request(input) if Character.all.empty?
            self.characters
        elsif input == 2
            Api.request(input) if Vehicle.all.empty?
            self.vehicles
        end
    end

    def movies(error_message="")
        puts "\n"
        puts "~~ Studio Ghibli Film Searcher ~~"
        puts "Please select a film you'd like to view information for" + "\n\n"
        Film.all.each_with_index do |movie, index|
            puts "#{index + 1}: #{movie.title}"
        end
        puts "\n"
        puts "If you would like to go back to previous screen please type 'back'"
        puts error_message
        input = gets.strip
        if input.numeric?
            input = input.to_i
            if input > Film.all.length || input <= 0
                self.movies("That is not a valid choice. Please enter a number shown on screen!")
            else
                input -= 1
                movie_detail(input)
            end
        else 
            input.downcase!
            if input == 'back'
                ask_for_choice
            else
                self.movies("That is not a valid choice. Please enter a number shown on screen!")
            end
        end
    end

    def movie_detail(choice, error_message="")
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
        puts error_message
        puts "1: Yes"
        puts "2: Exit"
        input = gets.strip
        if input.numeric?
            if input == "1"
                self.movies
            elsif  input == "2"
                exit
            else
                self.movie_detail(choice, "That is not a valid choice. Please enter a number shown on screen!")
            end
        elsif !input.numeric?
            input.downcase!
            if input == "exit"
                exit
            else
                self.movie_detail(choice, "That is not a valid choice. Please enter a number shown on screen!")
            end
        end
    end

    def characters(error_message="")
        puts "~~ Studio Ghibli Character Searcher ~~"
        puts "Please select a character you'd like to view information for" + "\n\n"

        Character.all.each_with_index do |char, index|
            puts "#{index + 1}: #{char.name}"
        end
        puts "\n"
        puts "If you would like to go back to previous screen please type 'back'"
        puts error_message
        input = gets.strip
        if input.numeric?
            input = input.to_i
            if input > Character.all.length || input <= 0
                self.characters("That is not a valid choice. Please enter a number shown on screen!")
            else
                input -= 1
                character_detail(input)
            end
        else 
            input.downcase!
            if input == 'back'
                ask_for_choice
            else
                self.characters("That is not a valid choice. Please enter a number shown on screen!")
            end
        end
    end

    def character_detail(choice, error_message="")
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
        puts error_message
        puts "1: Yes"
        puts "2: Exit"
        input = gets.strip
        if input.numeric?
            if input == "1"
                self.characters
            elsif  input == "2"
                exit
            else
                self.character_detail(choice, "That is not a valid choice. Please enter a number shown on screen!")
            end
        elsif !input.numeric?
            input.downcase!
            if input == "exit"
                exit
            else
                self.character_detail(choice, "That is not a valid choice. Please enter a number shown on screen!")
            end
        end
    end
    
    def vehicles
        puts "~~ Studio Ghibli Vehicle Searcher ~~"
        puts "Please select a vehicle you'd like to view information for" + "\n\n"
        Vehicle.all.each_with_index do |vehicle, index|
            puts "#{index + 1}: #{vehicle.name}"
        end
        puts "\n"
        puts "If you would like to go back to previous screen please type 'back'"
        input = gets.strip
        if input.numeric?
            input = input.to_i
            if input > Vehicle.all.length || input <= 0
                puts "Please enter a number shown on screen"
            else
                input -= 1
                vehicle_detail(input)
            end
        else
            input.downcase!
            if input == 'back'
                ask_for_choice
            else
                "That's not a choice, please select again"
            end
        end
    end

    def vehicle_detail(choice)
        vehicle_choice = Vehicle.all[choice]
        puts "~~ Studio Ghibli character Searcher ~~"
        puts "Name: #{vehicle_choice.name}"
        puts "Description: #{vehicle_choice.description}"
        puts "Vehicle Class: #{vehicle_choice.class}"
        puts "Size: #{vehicle_choice.length} FT"
        puts "Pilot: #{vehicle_choice.pilot}"
        puts "Film Appeared In: #{vehicle_choice.film}"
        puts "\n"
        puts "Would you like to go back to the previous list?"
        puts "1: Yes"
        puts "2: Exit"
        input = gets.strip
        if input == "1"
            self.vehicles
        elsif input == "2"
            exit
        end
    end


end