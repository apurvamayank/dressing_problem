require 'test/unit'
require '../dress_code'

class TestDressCode < Test::Unit::TestCase

  def with_socks_and_hat(input = "5 1")
    assert_equal ("socks,fail"), DressCode.new(input).dressed
  end

  def with_shoe_before_socks(input = "3 2 4 5")
    assert_equal "shirt,pants,fail", DressCode.new(input).dressed
  end

  def with_shoe_before_pant(input= "5 3 4 2")
    assert_equal "socks,shirt,fail", DressCode.new(input).dressed
  end

  def with_hat_not_last_dress_item(input = "5 2 3 1 4")
    assert_equal "socks,pants,shirt,fail", DressCode.new(input).dressed
  end

  def hat_is_optional(input = "5 2 3 4 6")
    assert_equal "socks,pants,shirt,shoes,leave", DressCode.new(input).dressed
  end

  def leave_without_dress(input = "5 2 3 6 4")
    assert_equal "socks,pants,shirt,fail", DressCode.new(input).dressed
  end

end

# test = TestDressCode.new('dress_test')
# test.with_socks_and_hat
# test.with_shoe_before_socks
# test.with_shoe_before_pant
# test.with_hat_not_last_dress_item
# test.hat_is_optional
# test.leave_without_dress