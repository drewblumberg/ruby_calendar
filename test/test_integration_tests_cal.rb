require_relative 'helper'
require 'minitest/autorun'

class TestCalendarIntegration < MiniTest::Unit::TestCase
  def test_no_input_from_user
    shell_output = `ruby cal.rb`
    expected_output = <<EOS
    January 2014    
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30 31
EOS
    assert_equal shell_output, expected_output
  end

  def test_february_of_leap_year
    shell_output = `ruby cal.rb 2 2012`
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

  def test_starts_on_saturday
    shell_output = `ruby cal.rb 1 2012`
    expected_output = <<EOS
    January 2012    
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
29 30 31
EOS
    assert_equal shell_output, expected_output
  end

  def test_6_week_month
    shell_output = `ruby cal.rb 9 2012`
    expected_output = <<EOS
   September 2012   
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30
EOS
    assert_equal shell_output, expected_output
  end

  def test_4_week_month
    shell_output = `ruby cal.rb 2 2015`
    expected_output = <<EOS
   February 2015    
Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7
 8  9 10 11 12 13 14
15 16 17 18 19 20 21
22 23 24 25 26 27 28
EOS
    assert_equal shell_output, expected_output
  end

  def test_february_in_leap_year_without_extra_day
    shell_output = `ruby cal.rb 2 1900`
    expected_output = <<EOS
   February 1900    
Su Mo Tu We Th Fr Sa
             1  2  3
 4  5  6  7  8  9 10
11 12 13 14 15 16 17
18 19 20 21 22 23 24
25 26 27 28
EOS
    assert_equal shell_output, expected_output
  end

  def test_leap_year_divisible_by_100_and_400
    shell_output = `ruby cal.rb 2 2000`
    expected_output = <<EOS
   February 2000    
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29
EOS
    assert_equal shell_output, expected_output
  end

  def test_full_year_formatting
    shell_output = `ruby cal.rb 2012`
    expected_output = <<EOS
                             2012                             

      January               February               March        
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7            1  2  3  4               1  2  3
 8  9 10 11 12 13 14   5  6  7  8  9 10 11   4  5  6  7  8  9 10
15 16 17 18 19 20 21  12 13 14 15 16 17 18  11 12 13 14 15 16 17
22 23 24 25 26 27 28  19 20 21 22 23 24 25  18 19 20 21 22 23 24
29 30 31              26 27 28 29           25 26 27 28 29 30 31
                                                                
       April                  May                   June        
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7         1  2  3  4  5                  1  2
 8  9 10 11 12 13 14   6  7  8  9 10 11 12   3  4  5  6  7  8  9
15 16 17 18 19 20 21  13 14 15 16 17 18 19  10 11 12 13 14 15 16
22 23 24 25 26 27 28  20 21 22 23 24 25 26  17 18 19 20 21 22 23
29 30                 27 28 29 30 31        24 25 26 27 28 29 30
                                                                
        July                 August              September      
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7            1  2  3  4                     1
 8  9 10 11 12 13 14   5  6  7  8  9 10 11   2  3  4  5  6  7  8
15 16 17 18 19 20 21  12 13 14 15 16 17 18   9 10 11 12 13 14 15
22 23 24 25 26 27 28  19 20 21 22 23 24 25  16 17 18 19 20 21 22
29 30 31              26 27 28 29 30 31     23 24 25 26 27 28 29
                                            30                  
      October               November              December      
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
    1  2  3  4  5  6               1  2  3                     1
 7  8  9 10 11 12 13   4  5  6  7  8  9 10   2  3  4  5  6  7  8
14 15 16 17 18 19 20  11 12 13 14 15 16 17   9 10 11 12 13 14 15
21 22 23 24 25 26 27  18 19 20 21 22 23 24  16 17 18 19 20 21 22
28 29 30 31           25 26 27 28 29 30     23 24 25 26 27 28 29
                                            30 31               
EOS
    assert_equal shell_output, expected_output
  end

  def test_argument_capturing_month_and_year
    shell_output = `ruby cal.rb 1 2012`
    assert shell_output.include? "January 2012"
  end

  def test_argument_capturing_only_year
    shell_output = `ruby cal.rb 2012`
    assert shell_output.include? "2012"
  end

  def test_argument_does_not_contain_chars_first_arg
    exception = assert_raises(ArgumentError) do
      Month.new("abc")
    end

    assert_match(/Arguments can only contain positive, non-zero integers/, exception.message)
  end

  def test_only_one_argument_is_a_year_between_1800_and_3000
    exception = assert_raises(ArgumentError) do
      Month.new(10)
    end

    assert_match(/Year must be between 1800 and 3000/, exception.message)
  end

  def test_two_arguments_for_correct_month
    exception = assert_raises(ArgumentError) do
      Month.new(2012, 2012)
    end

    assert_match(/Month must be between 1 and 12/, exception.message)
  end

  def test_two_arguments_for_correct_month
    exception = assert_raises(ArgumentError) do
      Month.new(2012, 2012)
    end

    assert_match(/Month must be between 1 and 12/, exception.message)
  end

  def test_two_arguments_for_correct_year
    exception = assert_raises(ArgumentError) do
      Month.new(1, 10)
    end

    assert_match(/Year must be between 1800 and 3000/, exception.message)
  end

  def test_for_more_than_two_arguments
    exception = assert_raises(ArgumentError) do
      Month.new(1, 2012, 1)
    end

    assert_match(/Only two arguments allowed, month and year/, exception.message)
  end

  def test_presence_of_header_row
    shell_output = `ruby cal.rb 1 2012`
    expected_output = "Su Mo Tu We Th Fr Sa"

    assert shell_output.include? expected_output
  end

end