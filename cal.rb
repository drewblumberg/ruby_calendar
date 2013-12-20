require_relative 'month'

# Constants
months = {1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December"}

# Capture Arguments
if ARGV.length == 2
  month = ARGV[0].to_i
  year = ARGV[1].to_i
  calendar_month = Month.new(month, year)
else
  year = ARGV[0].to_i
  calendar_month = Month.new(year)
end

# Put Calendar to shell
if calendar_month
  if month.nil?
    puts "#{year}"
  else
    puts "#{months[month]} #{year}"
  end
end