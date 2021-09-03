require 'rubygems'
require 'json'

json = File.read("../versions/wings.json")
obj  = JSON.parse(json)

puts(obj["url"])
puts(obj["sha256"])
filename = File.basename(__FILE__, File.extname(__FILE__,))
