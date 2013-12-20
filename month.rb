class Month
  @@month_nums = [13,14,3,4,5,6,7,8,9,10,11,12]

  def self.zeller(month, year)
    m = @@month_nums[month-1]
    year = year - 1 if m == 13 or m == 14
    k = year % 100
    j = (year/100).floor

    h = (1 + (13/5*(m+1)).floor + k + (k/4).floor + (j/4).floor - 2 * j) % 7

    return h
  end

end