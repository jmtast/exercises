# in test/lawyer_test.rb

gem 'minitest'
require 'minitest/autorun'
require_relative '../model/lawyer.rb'

class TestLawyer < MiniTest::Unit::TestCase
  def setup
    @lawyer = Lawyer.new('a_name')
  end

  def test_lawyer_gets_created_with_a_name
    assert_equal "a_name", @lawyer.get_name
  end

  def test_lawyer_gets_created_with_a_given_name
    @another_lawyer = Lawyer.new('another_name')
    assert_equal "another_name", @another_lawyer.get_name
  end
end