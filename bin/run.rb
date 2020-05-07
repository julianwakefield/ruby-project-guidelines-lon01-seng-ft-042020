require_relative '../config/environment'
cli = Application.new

cli.title_screen
cli.welcome

cli.exit_screen
    
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



