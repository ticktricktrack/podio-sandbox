require "pry"
require "awesome_print"
require "./podio_adapter"

puts "Loading Podio"

app_id = # put the podio app ID here
PodioAdapter.new

# Examples
items = Podio::Item.find_all(app_id)

# this gives you an interactive console
binding.pry

# ap stuff for prettier output
ap items.first.first.attributes




puts "Have a nice day"
