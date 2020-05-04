require_relative '../config/environment'
cli = Application.new

cli.welcome
cli.main_menu
    
# def search_by_property(prop,value)
#     if prop == "byNight"
#         if Property.min(:price).value < value
            
#             Property.all.where("#{prop} >= ?", value).limit(5)
#         else
            
#             Property.all.where("#{prop} <= ?", value).limit(5)
#         end
        
#     else
        
#     end
# end



puts "HELLO WORLD"
