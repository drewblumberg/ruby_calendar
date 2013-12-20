require_relative '../cal'
require 'minitest/autorun'

class TestCalendar < Minitest::Unit::TestCase
  def test_cal_has_a_zeller_method
    Calendar.zeller(1, 2012)
  end

end