# in test/case_document_test.rb

gem 'minitest'
require 'minitest/autorun'
require_relative '../model/lawyer.rb'
require_relative '../model/case_document.rb'

class TestCaseDocument < MiniTest::Unit::TestCase
  def setup
    @lawyer = Lawyer.new('a_name')
    @case = CaseDocument.new(@lawyer)
  end

  def test_case_gets_created_with_an_owner
    assert_equal @lawyer, @case.owner
  end
end