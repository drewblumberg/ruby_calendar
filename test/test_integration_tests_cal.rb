require_relative 'helper'
require 'minitest/autorun'

class TestCalendarIntegration < MiniTest::Unit::TestCase
  def test_no_input_from_user
    shell_output = ""
    IO.popen('ruby cal.rb', 'r+') do |pipe|
      shell_output = pipe.read
    end
    expected_output = <<EOS
   December 2013
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31
EOS
    assert_equal shell_output, expected_output
  end

  def test_february_of_leap_year
    shell_output = ""
    IO.popen('ruby cal.rb 2 2012', 'r+') do |pipe|
      shell_output = pipe.read
    end
    expected_output = <<EOS
   February 2012
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29
EOS
    assert_equal shell_output, expected_output
  end

end