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
        a = Artii::Base.new :font => 'banner3'
        puts a.asciify('Welcome to').light_green
        puts " "
        puts a.asciify('RoomBooker').light_green
        puts " "
        puts " "
        # puts " Booking made easy ".yellow.center(80, "-*")       
       
        # msg = "                           Loading Please Wait...                      "
        msg = "Loading Please Wait...".center(100)
        5.times do
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
        system "clear"
        puts ""
        puts ""
        a = Artii::Base.new :font => 'banner3'
        puts a.asciify('Welcome to').light_green
        puts ""
        puts a.asciify('RoomBooker').light_green
        puts ""
        puts ""
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
             menu.choice "Exit", -> {quit = true}
         end
        end
    end

    

    def find_or_create_new_user
        system "clear"
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
        system "clear"
        properties = Property.all.each {|property| property}
        choices = render_method(properties)
        properties = properties.map {|property| {name: property.title, value: property}}
        @selected_prop = prompt.select("Please select a property",properties)
        # binding.pry
        new_book
    end

    def render_method(properties)
        system "clear"
        # arrayOfArraysOfProperies = properties.each_slice(3).to_a
        # arrayOfArraysOfProperies.each do |arrayOfPropeties|
        #     arrayOfPropeties.each do |property|
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
        system "clear"
        want_wifi = self.prompt.ask("Wi-Fi? yes/no")
        properties = Property.all.select {|property| property.wi_fi == want_wifi}
        choices = render_method(properties)
        properties = properties.map {|property| {name: property.title, value: property}}
        @selected_prop = prompt.select("Please select a property",properties)
        # binding.pry
        new_book
        

    end

    def self_catered
        system "clear"
        catered_reply = self.prompt.ask("Self-catered? yes/no")
        properties = Property.all.select {|property| property.self_catered == catered_reply}
        choices = render_method(properties)
        properties = properties.map {|property| {name: property.title, value: property}}
        @selected_prop = prompt.select("Please select a property",properties)
        # binding.pry
        new_book
       
    end

    def no_of_bedrooms
        system "clear"
        room_reply = self.prompt.ask("How many rooms would you like to book?")
        properties = Property.all.select {|property| property.no_of_rooms == room_reply.to_i}
        if properties.size == 0 
            sleep 2
            puts "there arent house available with  #{room_reply} of rooms"
            sleep 2
            no_of_bedrooms
        end 
        choices = render_method(properties)
        properties = properties.map {|property| {name: property.title, value: property}}
        @selected_prop = prompt.select("Please select a property",properties)
        available_room = @selected_prop.no_of_rooms
        if available_room <= 0
            puts "No rooms available in this property please choose a new property"
            sleep 2
            no_of_bedrooms
        end
        update_room = available_room - room_reply.to_i
        @selected_prop.update(no_of_rooms: update_room)
        new_book
    end

    def price_per_night
        system "clear"
        price_reply2 = self.prompt.ask("What's your maximum budget per night?")
        properties = Property.all.select {|property| property.price_per_night <= price_reply2.to_i}
        choices = render_method(properties)
        properties = properties.map {|property| {name: property.title, value: property}}
        @selected_prop = prompt.select("Please select a property",properties)
        #binding.pry
        new_book
        
    end

    def new_book
        
        new_booking = Booking.create(user_id: @user.id, property_id: @selected_prop.id)
        
        # Property.all.find {|booked_prop| booked_prop == @user.properties }
        puts "Thank you for your booking"
        
       
        main_menu
    end

    def my_bookings
        system "clear"
        all_bookings = User.find(@user.id).properties 
        if all_bookings.size == 0
           puts "empty"
        else
        
         
        render_method(all_bookings)
        choices = render_method(all_bookings)
        all_bookings = all_bookings.map {|property| {name: property.title, value: property }}
        all_bookings = prompt.select("Here are your bookings , select one if you want to cancel it", all_bookings,)
        #menu.goback"Back to Main Menu", -> {}
        @user.properties.destroy(all_bookings)
         
        end 
        
    end

    def exit_screen
        system "clear"
        puts ''
        puts ''
        a = Artii::Base.new :font => 'banner3'
        puts a.asciify('See You').light_green
        puts " "
        puts a.asciify('Next Time!').light_green
        puts ''
        puts ''
        # puts " Booking made easy ".yellow.center(80, "-*")       
       
        # msg = "                           Loading Please Wait...                      "
        msg = "Shutting Down Please Wait...".center(80)
        5.times do
        print "\r#{ msg}".light_black
        sleep 0.5
        print "\r#{ ' ' * msg.size }"  # Send return and however many spaces are needed.
        sleep 0.5
        
        end
        system "clear"
    end

    # def price_per_night_range
    #     properties = Property.all.select do |property| 
    #     property.price_per_night >= 100 && property.price_per_night <= 350
    #     end
    #     render_method(properties)
    # end

 
end
  
    
            



