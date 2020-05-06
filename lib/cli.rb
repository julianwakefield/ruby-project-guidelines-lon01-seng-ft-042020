require "pry"
class Application

    attr_reader :prompt
    attr_accessor :user , :selected_prop ,:all, :new_booking, :created_booking

    @@all = []
    def initialize()
        @prompt = TTY::Prompt.new
        @tty_prompt= TTY::Prompt.new
        @user = nil
        @selected_prop = nil
        @new_booking = nil
        @created_booking = nil
        
        
    end

    def title_screen
        system "clear"
        puts ''
        puts ''
        a = Artii::Base.new :font => 'speed'
        puts a.asciify('Welcome to').light_green
        puts a.asciify('RoomBooker').light_green
        puts ''
        puts ''
        # puts " Booking made easy ".yellow.center(80, "-*")       
       
        # msg = "                           Loading Please Wait...                      "
        msg = "Loading Please Wait...".center(70)
        10.times do
        print "\r#{ msg}".light_black
        sleep 0.5
        print "\r#{ ' ' * msg.size }"  # Send return and however many spaces are needed.
        sleep 0.5
        end
  
    end
    
    def user_input
        gets.chomp
    end

    def welcome
        puts "Hello! Welcome to the app"
        choice = self.prompt.select("Are you a New user or Returning user?") do |menu|
            menu.choice "New User", ->{find_or_create_new_user}
            menu.choice "Returning User", ->{find_or_create_new_user}

            
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
             menu.choice "Manage My Bookings", -> {my_bookings}
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

    def find_or_create_new_user
        reply = self.prompt.ask("What is your name? (Please enter your name and hit enter twice to confirm)")
        @user = User.find_or_create_by(name: reply)
        
        main_menu
        # needs money in wallet
    end

        
    def booking_menu
        system "clear"
        choice = self.prompt.select("Search by:") do |menu|
           
            # create a booking?
            menu.choice "No. of Bedrooms", -> {no_of_bedrooms}
            menu.choice "Self-catering?", -> {self_catered}
            menu.choice "Price per night", -> {price_per_night} 
            menu.choice "Wifi", -> {wi_fi}
            menu.choice "All Properties", -> {all_properties}
            menu.choice "Main Menu", -> {}
        end
    end

    def all_properties
        properties = Property.all.each do |property|
        end
        render_method(properties)
    end

    def render_method(properties)
        properties.each do |property|
            puts "title: #{property.title}
            no_of_rooms: #{property.no_of_rooms}
            self_catered: #{property.self_catered}
            wi_fi: #{property.wi_fi}
            price_per_night: #{property.price_per_night}"
            puts ""
            end
    end

    def wi_fi
        properties = Property.all.select do |property| 
        property.wi_fi == "yes"
        end
        render_method(properties)
    end

    def self_catered
        catered_reply = self.prompt.ask("Self-catered? yes/no")
        properties = Property.all.select do |property| 
        property.self_catered == "#{catered_reply}"
       
        end
        
        render_method(properties)
    end

    def no_of_bedrooms
        room_reply = self.prompt.ask("How many rooms will you like to book?")
        properties = Property.all.select do |property| 
        property.no_of_rooms == room_reply.to_i
        end
        render_method(properties)
    end

    def price_per_night
        
        price_reply2 = self.prompt.ask("What's your maximum budget per night?")
        properties = Property.all.select {|property| property.price_per_night <= price_reply2.to_i}
        choices = render_method(properties)
        properties = properties.map {|property| {name: property.title, value: property }}
        @selected_prop = prompt.select("type the house that you want",properties)
        #binding.pry
        new_booking
        
    end

    def new_booking
        
        @new_booking = Booking.create(user_id:@user.id, property_id: @selected_prop.id)
        
        puts "Thank you for your booking"
        
        main_menu
    end

    def my_bookings
        
    Booking.all.find_by(@new_booking.user_id == @user.id)
       binding.pry
       all_properties.find{|property| property.property_id == @new_booking.id} 

        # puts "Here is your booking:"
        # puts "Name: #{user_id}"
    
        # puts "Property: #{property_id}"
       
        # render_method(properties)
        #binding.pry
    end
    
   
    # def price_per_night_range
    #     properties = Property.all.select do |property| 
    #     property.price_per_night >= 100 && property.price_per_night <= 350
    #     end
    #     render_method(properties)
    # end

 
end
  
    # Login_menu
        #  password
    # main_menu
        # Create new booking
        # View current bookings
            # cancel booking
            # amend booking
            # back to main menu
        # Quit
            # Are you sure you want to quit? Y/N



