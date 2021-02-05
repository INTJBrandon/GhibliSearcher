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
        search = Api.request(input)
        if input == 0
            self.movies
        elsif input == 1
            self.characters(search)
        elsif input == 2
            self.vehicles(search)
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
            movies()
        elsif input == "2"
            exit
        end
    end

    def characters(choice)
        puts "~~ Studio Ghibli Vehicle Searcher ~~"
        puts "Name: #{choice.name}"
        puts "Gender: #{choice.gender}"
        puts "age: #{choice.age}"
        puts "Eye Color: #{choice.eye_color}"
        puts "Hair Color: #{choice.hair_color}"
        puts "Film Appeared In: #{choice.film}"
    end
    
    def vehicles(choice)
        puts "~~ Studio Ghibli character Searcher ~~"
        puts "Name: #{choice.name}"
        puts "Description: #{choice.description}"
        puts "Vehicle Class: #{choice.class}"
        puts "Size: #{choice.length} FT"
        puts "Pilot: #{choice.pilot}"
        puts "Film Appeared In: #{choice.film}"
    end


end