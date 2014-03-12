# in test/lawyer_test.rb

gem 'minitest'
require 'minitest/autorun'
require_relative '../model/lawyer'

class TestLawyer < MiniTest::Unit::TestCase
  def setup
    @lawyer = Lawyer.new('a_name')
    @another_lawyer = Lawyer.new('another_name')
  end

  def test_lawyer_gets_created_with_a_name
    assert_equal "a_name", @lawyer.name
  end

  def test_lawyer_gets_created_with_a_given_name
    @another_lawyer = Lawyer.new('another_name')
    assert_equal "another_name", @another_lawyer.name
  end

  def test_all_lawyers_can_be_listed
    assert_includes Lawyer.all, @lawyer
    assert_includes Lawyer.all, @another_lawyer
  end
end