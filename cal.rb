# Constants
months = {1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December"}

# Capture Arguments
if ARGV.length == 2
  month = ARGV[0].to_i
  year = ARGV[1].to_i
else
  year = ARGV[0].to_i
end

# Put Calendar to shell

if month.nil?
  puts "#{year}"
else
  puts "#{months[month]} #{year}"
end