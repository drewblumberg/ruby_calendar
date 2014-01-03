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

num_months.times do

  start_day = calendar_month.get_zeller(month, year)
  day_array = calendar_month.month_num_days

  if year % 4 == 0 and month == 2
    if year % 100 == 0
      day_array[1] = 29 if year % 400 == 0
    else
      day_array[1] = 29
    end
  end

  formatted_month = "#{months[month]}".center(20) if num_months == 12
  formatted_month << "\nSu Mo Tu We Th Fr Sa\n"

  spaces = calendar_month.initial_spaces(start_day)
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

  formatted_months.push(formatted_month)
  month += 1

end

if formatted_months.length == 1
  puts formatted_months[0]
else
  # temp_string = ""
  puts formatted_year
  split_month_array = []
  formatted_months.each do |formatted_month|
    temp = formatted_month.split("\n")
    split_month_array.push(temp)
  end

  formatted_months.each_with_index do |formatted_month, index|
    if index == 0 or index == 3 or index == 6 or index == 9
      i = 0
      8.times do
        if split_month_array[index][i]
          col1 = split_month_array[index][i]
          if col1.length != 20
            col1 << " " until col1.length == 20
          end
        else
          col1 = "                    "
        end

        if split_month_array[index+1][i]
          col2 = split_month_array[index+1][i]
          if col2.length != 20
            col2 << " " until col2.length == 20
          end
        else
          col2 = "                    "
        end

        if split_month_array[index+2][i]
          col3 = split_month_array[index+2][i]
          if col3.length != 20
            col3 << " " until col3.length == 20
          end
        else
          col3 = "                    "
        end

        puts col1 + "  " + col2 + "  " + col3
        i+=1
      end
    end
  end
end