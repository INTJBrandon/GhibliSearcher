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
            self.movies(search)
        elsif input == 1
            self.characters(search)
        end
    end

    def movies(choice)
        puts "~~ Studio Ghibli Film Searcher ~~"
        puts "Title of Movie: #{choice.title}"
        puts "Description: #{choice.description}"
        puts "Director: #{choice.director}"
        puts "Producer: #{choice.producer}"
        puts "Release Date: #{choice.release_date}"
        puts "Rotten Tomato Score: #{choice.rotten_score} %"
    end
    def characters(choice)
        puts "~~ Studio Ghibli character Searcher ~~"
        puts "Name: #{choice.name}"
        puts "Gender: #{choice.gender}"
        puts "age: #{choice.age}"
        puts "Eye Color: #{choice.eye_color}"
        puts "Hair Color: #{choice.hair_color}"
        puts "Film Appeared In: #{choice.film}"
    end  

end