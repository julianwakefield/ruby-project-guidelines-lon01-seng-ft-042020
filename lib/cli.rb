require "pry"
class Application

    attr_reader :prompt

    
    def initialize()
        @prompt = TTY::Prompt.new
        @tty_prompt= TTY::Prompt.new
    end

    def user_input
        gets.chomp
    end

    def welcome
        puts "Hello! Welcome to the app"
        choice = self.prompt.select("Are you a New user or Returning user?") do |menu|
            menu.choice "New User", ->{new_user}
            menu.choice "Returning User", ->{returning_user}

            
            # something here?
        end
    end

    def main_menu
        system "clear"
        puts "Hello, #{}!"
         puts ""
         choice = self.prompt.select("Welcome! Please select one of the following:") do |menu|
             # create a booking?
             menu.choice "My Bookings", -> {self.user.Booking}
             menu.choice "Manage Bookings", -> {self.user.manage_account}
             menu.choice "Search Bookings", -> {self.search}
             menu.choice "Exit", -> {Application.exit_app}
         end
    end

    def self.exit_app
        system "clear"
        puts ""
        puts "See you next time!  by the swimming pool"
        puts ""
        exit!
    end



    def new_user
        reply = self.prompt.ask("What is your name? (Please enter your name and hit enter twice to confirm)")
        reply = user_input
        User.create(name: reply)
        main_menu
        
    end
 

    def returning_user
        reply = self.prompt.ask("What is your name? (Please enter your name and hit enter twice to confirm)")
        reply = user_input
        #User.all.find{|user| user.name == reply}
    end

        



        
        
        
        # please enter your name
        # user input



    # Login_menu
    # main_menu
        # Create new booking
        # View current bookings
            # cancel booking
            # amend booking
            # back to main menu
        # Quit
            # Are you sure you want to quit? Y/N



end