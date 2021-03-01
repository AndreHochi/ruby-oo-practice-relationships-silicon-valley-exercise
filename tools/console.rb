require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup_1 = Startup.new("1")
startup_1.pivot("1", "d1")
startup_2 = Startup.new("2")
startup_2.pivot("2", "d2")

p Startup.domains
binding.pry
0 #leave this here to ensure binding.pry isn't the last line