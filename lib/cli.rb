require "pry"
class Application

    attr_reader :prompt
    attr_accessor :user

    
    def initialize()
        @prompt = TTY::Prompt.new
        @tty_prompt= TTY::Prompt.new
        @user = nil
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
        quit = false
        system "clear"
        puts "Hello, #{@user.name}!"
         puts ""
         while !quit
             
         
         choice = self.prompt.select("Welcome! Please select one of the following:") do |menu|
             # create a booking?
             menu.choice "Make a Booking", -> {booking_menu} 
                    # allows to search properties and make a new booking
                    # search properites - list of all properties
                        
                        # search by wifi, bedrooms, self-catering, price - list all -- menu
                        # don't want to list any that are FULL
                        # create the booking if fully paid
             menu.choice "Manage My Bookings", -> {self.user.Booking}
                #  menu.choice "Manage Bookings", -> {self.user.manage_account}
                    # update booking
                    #  cancel booking
             menu.choice "Exit", -> {Application.exit_app}
         end
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
        @user = User.new(name: reply)
        #User.find_or_create_by(name: reply)
        
        main_menu
        # needs money in wallet
        
    end
 

    def returning_user
        reply = self.prompt.ask("What is your name? (Please enter your name and hit enter twice to confirm)")
        reply = user_input
        User.all.find{|user| user.name == reply}
    end

        
    def booking_menu
        system "clear"
        choice = self.prompt.select("Search by:") do |menu|
           
            # create a booking?
            menu.choice "No. of Bedrooms", -> {self.search_properties}
            menu.choice "Self-catering?", -> {self.search_properties}
            menu.choice "Price per night", -> {price_per_night} 
            menu.choice "Wifi", -> {wi_fi}
            menu.choice "All Properties", -> {all_properties}
            menu.choice "Main Menu", -> {}
        end
    end

    def price_per_night
        
        Property.all.select {|property| property.price_per_night == 1000}
          puts  "title: #{property.title}
            no_of_rooms: #{property.no_of_rooms}
            self_catered: #{property.self_catered}
            wi_fi: #{property.wi_fi}
            price_per_night: #{property.price_per_night}"
            puts ""

    end

    def wi_fi
        Property.all.select do |property| property.wi_fi == "yes"
         puts  "title: #{property.title}
        no_of_rooms: #{property.no_of_rooms}
        self_catered: #{property.self_catered}
        price_per_night: #{property.price_per_night}"
        puts ""

        end
    end

    def all_properties
        # choice = self.prompt.select("Select your property") do |property|
            # property.choice
        Property.all.map do |property|
           puts " title: #{property.title}
            no_of_rooms: #{property.no_of_rooms}
            wi_fi: #{property.wi_fi}
            self_catered: #{property.self_catered}
            price_per_night: #{property.price_per_night}"
        
            end
        end
    end

        def new_booking
            Booking.create(user_id: @user, property_id: self.property_id)
        end

end

    


    # "property.title #{property.title}
    # no_of_rooms #{property.no_of_rooms}
    # self_catered: #{property.self_catered}
    # wi_fi: #{property.wi_fi}
    # price_per_night: #{property.price_per_night}"
    # def properties
    #     Property.all.map{|property| property.}

    # end

    # def search_all_properties
    #     Property.all
    # end

    # def no_of_bedrooms
    #     puts "how many bedrooms?"
    #     reply = user_input 
    # end
        
        
        
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



