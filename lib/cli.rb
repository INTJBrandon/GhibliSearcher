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
        # input = gets.strip
        #  do something with choice
        Api.request
    end
end