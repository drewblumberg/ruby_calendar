require_relative 'helper'
require 'minitest/autorun'

class TestCalendarIntegration < MiniTest::Unit::TestCase
#   def test_no_input_from_user
#     shell_output = `ruby cal.rb`
#     expected_output = <<EOS
#    December 2013
# Su Mo Tu We Th Fr Sa
#  1  2  3  4  5  6  7
#  8  9 10 11 12 13 14
# 15 16 17 18 19 20 21
# 22 23 24 25 26 27 28
# 29 30 31
# EOS
#     assert_equal shell_output, expected_output
#   end

#   def test_february_of_leap_year
#     shell_output = `ruby cal.rb 2 2012`
#     expected_output = <<EOS
#    February 2012
# Su Mo Tu We Th Fr Sa
#           1  2  3  4
#  5  6  7  8  9 10 11
# 12 13 14 15 16 17 18
# 19 20 21 22 23 24 25
# 26 27 28 29
# EOS
#     assert_equal shell_output, expected_output
#   end

#   def test_starts_on_saturday
#     shell_output = `ruby cal.rb 1 2012`
#     expected_output = <<EOS
#     January 2012
# Su Mo Tu We Th Fr Sa
#  1  2  3  4  5  6  7
#  8  9 10 11 12 13 14
# 15 16 17 18 19 20 21
# 22 23 24 25 26 27 28
# 29 30 31
# EOS
#     assert_equal shell_output, expected_output
#   end

#   def test_6_week_month
#     shell_output = `ruby cal.rb 9 2012`
#     expected_output = <<EOS
#    September 2012
# Su Mo Tu We Th Fr Sa
#                    1
#  2  3  4  5  6  7  8
#  9 10 11 12 13 14 15
# 16 17 18 19 20 21 22
# 23 24 25 26 27 28 29
# 30
# EOS
#     assert_equal shell_output, expected_output
#   end

#   def test_4_week_month
#     shell_output = `ruby cal.rb 2 2015`
#     expected_output = <<EOS
#    February 2015
# Su Mo Tu We Th Fr Sa
#  1  2  3  4  5  6  7
#  8  9 10 11 12 13 14
# 15 16 17 18 19 20 21
# 22 23 24 25 26 27 28
# EOS
#     assert_equal shell_output, expected_output
#   end

#   def test_february_in_leap_year_without_extra_day
#     shell_output = `ruby cal.rb 2 1900`
#     expected_output = <<EOS
#    February 1900
# Su Mo Tu We Th Fr Sa
#              1  2  3
#  4  5  6  7  8  9 10
# 11 12 13 14 15 16 17
# 18 19 20 21 22 23 24
# 25 26 27 28
# EOS
#     assert_equal shell_output, expected_output
#   end

#   def test_leap_year_divisible_by_100_and_400
#     shell_output = `ruby cal.rb 2 2000`
#     expected_output = <<EOS
#    February 2000
# Su Mo Tu We Th Fr Sa
#        1  2  3  4  5
#  6  7  8  9 10 11 12
# 13 14 15 16 17 18 19
# 20 21 22 23 24 25 26
# 27 28 29
# EOS
#     assert_equal shell_output, expected_output
#   end

#   def test_outside_of_scope
#     shell_output = `ruby cal.rb 1 3005`
#     expected_output = "The Year 3005 is not between 1800 and 3000. Try again."
#     assert_equal shell_output, expected_output
#   end

  def test_argument_capturing_month_and_year
    shell_output = `ruby cal.rb 1 2012`
    assert shell_output.include? "January 2012"
  end

  def test_argument_capturing_only_year
    shell_output = `ruby cal.rb 2012`
    assert shell_output.include? "2012"
  end

end