class Month
  @@month_nums = [13,14,3,4,5,6,7,8,9,10,11,12]

  def initialize(*args)
    args.each do |arg|
      raise ArgumentError, "Arguments can only contain integers" if arg.to_i == 0
      raise ArgumentError, "Year must be between 1800 and 3000" if args.length == 1 and (arg.to_i < 1800 or arg.to_i> 3000)
    end
  end

  def self.zeller(month, year, day=1)
    m = @@month_nums[month-1]
    year -= 1 if m == 13 or m == 14

    h = (day + (26 * (m+1) / 10).floor + year + (year/4).floor + 6*(year/100).floor + (year/400).floor) % 7

    return h
  end

end