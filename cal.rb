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
start_day = calendar_month.get_zeller(month, year) if month

if calendar_month
  if month.nil?
    puts "#{year}".center(20)
  else
    formatted_month = "#{months[month]} #{year}".center(20)
    formatted_month << "\nSu Mo Tu We Th Fr Sa"
    puts formatted_month
    # puts "#{months[month]} #{year}".center(20)
    # puts "Su Mo Tu We Th Fr Sa"
    # puts "#{start_day}"
  end
end