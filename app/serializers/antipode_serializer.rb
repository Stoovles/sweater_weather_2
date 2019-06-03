class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :search_location,
             :antipode_city,
             :summary,
             :current_temperature

end



# ```
# {
#     "data": [
#         {
#             "id": "1",
#             "type": "antipode",
#             "attributes": {
#                 "location_name": "Antipode City Name",
#                 "forecast": {
#                     "summary": "Mostly Cloudy,
#                     "current_temperature": "72",
#                 				},
#             "search_location": "Hong Kong"
#             }
#         }
#     ]
# }
# ```
