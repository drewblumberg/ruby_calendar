require_relative '../month'
require 'minitest/autorun'

class TestMonth < Minitest::Unit::TestCase
  def test_month_has_zeller_method
    Month.zeller(1, 2012)
  end

  def test_month_returns_zero_for_january_2012
    day = Month.zeller(1, 2012)
    assert_equal day, 0
  end

end