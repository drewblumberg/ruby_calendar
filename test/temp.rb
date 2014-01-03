require_relative 'month'

# Constants
months = {1 => "January", 2 => "February", 3 => "March", 4 => "April", 5 => "May", 6 => "June", 7 => "July", 8 => "August", 9 => "September", 10 => "October", 11 => "November", 12 => "December"}

# Capture Arguments
if ARGV.length == 2
  month = ARGV[0].to_i
  year = ARGV[1].to_i
  calendar_month = Month.new(month, year)
elsif ARGV.length == 1
  year = ARGV[0].to_i
  calendar_month = Month.new(year)
else
  time = Time.new
  month = time.month
  year = time.year
  calendar_month = Month.new(month, year)
end


# Put Calendar to shell

if month.nil?
  formatted_year =  "#{year}".center(62)
  formatted_year << "\n\n"
  month = 1
  num_months = 12
  year_array = []
else
  formatted_month = "#{months[month]} #{year}".center(20)
  num_months = 1
end

formatted_months = []

index = 1
num_months.times do

  if (index - 1) % 3 == 0
    month2 = month + 1
    month3 = month + 2

    start_day = calendar_month.get_zeller(month, year)
    start_day2 = calendar_month.get_zeller(month2, year) if num_months == 12
    start_day3 = calendar_month.get_zeller(month3, year) if num_months == 12

    calendar_month2 = Month.new(month2, year) if num_months == 12
    calendar_month3 = Month.new(month3, year) if num_months == 12

    day_array = calendar_month.month_num_days
    day_array2 = calendar_month2.month_num_days if calendar_month2
    day_array3 = calendar_month3.month_num_days if calendar_month3

    if year % 4 == 0 and (month == 2 or month2 == 2 or month3 == 2)
      if year % 100 == 0
        day_array[1] = 29 if year % 400 == 0 and month == 2
        day_array2[1] = 29 if year % 400 == 0 and month2 == 2
        day_array3[1] = 29 if year % 400 == 0 and month3 == 2
      else
        day_array[1] = 29 if month == 2
        day_array2[1] = 29 if month2 == 2
        day_array3[1] = 29 if month3 == 2
      end
    end
  

    formatted_month = "#{months[month]}".center(20) if num_months == 12
    formatted_month << " #{months[month2]}".center(20) if num_months == 12
    formatted_month << " #{months[month3]}".center(20) if num_months == 12

    formatted_month << "\nSu Mo Tu We Th Fr Sa"
    formatted_month << "\n" if num_months == 1
    formatted_month << " Su Mo Tu We Th Fr Sa" if num_months == 12
    formatted_month << " Su Mo Tu We Th Fr Sa\n" if num_months == 12

    spaces = calendar_month.initial_spaces(start_day)
    spaces2 = calendar_month.initial_spaces(start_day2) if num_months == 12
    spaces3 = calendar_month.initial_spaces(start_day3) if num_months == 12
  
    if num_months == 1
      formatted_month << spaces
      i = 1
      day_array[month-1].times do
        new_line = false

        if i < 10
          formatted_month << " #{i}"
        else
          formatted_month << "#{i}"
        end

        if start_day == 0
          if (i - 1) % 7 == 0
            formatted_month << "\n"
            new_line = true
          end
        elsif start_day == 1
          if i % 7 == 0
            formatted_month << "\n"
            new_line = true
          end
        else
          if ((i - 1) + start_day) % 7 == 0
            formatted_month << "\n"
            new_line = true
          end
        end

        formatted_month << " " unless new_line or i == day_array[month-1]

        i+=1
      end
    else
      formatted_month << spaces
    end
  end

  formatted_months.push(formatted_month)
  month += 1

  index += 1
end

puts formatted_months[0] if formatted_months.length == 1
puts formatted_months[3] + " " + formatted_months[4] if formatted_months.length > 1

# temp_string = ""
# formatted_months.each_with_index do |formatted_month, index|
#   temp_string << formatted_month
#   if (index + 1) % 3 != 0
#     temp_string << " " 
#   else
#     puts temp_string
#     puts "\n"
#   end
# end