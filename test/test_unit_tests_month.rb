require_relative '../month'
require 'minitest/autorun'

class TestMonth < Minitest::Unit::TestCase
  def test_month_has_zeller_method
    Month.zeller(1, 2012)
  end

  # Sat - Fri (0 - 6)

  def test_month_returns_one_for_sunday
    day = Month.zeller(1, 2012)
    assert_equal 1, day
  end

  def test_month_returns_two_for_monday
    day = Month.zeller(1, 2012, 2)
    assert_equal 2, day
  end

  def test_month_returns_three_for_tuesday
    day = Month.zeller(1, 2012, 3)
    assert_equal 3, day
  end

  def test_month_returns_four_for_wednesday
    day = Month.zeller(1, 2012, 4)
    assert_equal 4, day
  end

  def test_month_returns_six_for_friday
    day = Month.zeller(1, 2012, 6)
    assert_equal 6, day
  end

  def test_month_returns_zero_for_saturday
    day = Month.zeller(1, 2012, 7)
    assert_equal 0, day
  end

  # Unique test cases

  def test_month_begins_on_thursday_march_2012
    day = Month.zeller(3, 2012)
    assert_equal 5, day
  end

end