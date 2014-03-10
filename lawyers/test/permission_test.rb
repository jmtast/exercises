# in test/permission_test.rb

gem 'minitest'
require 'minitest/autorun'
require_relative '../model/lawyer.rb'
require_relative '../model/case_document.rb'
require_relative '../model/permission.rb'

class TestPermission < MiniTest::Unit::TestCase
  def setup
    @lawyer = Lawyer.new('a_name')
    @another_lawyer = Lawyer.new('another_name')
    @case_document = CaseDocument.new(@lawyer)
    @permission = Permission.new(@lawyer, @another_lawyer, @case_document)
  end

  def test_permission_has_a_source
    assert_equal @lawyer, @permission.source
  end

  def test_permission_has_a_destination
    assert_equal @another_lawyer, @permission.destination
  end

  def test_permission_has_lawyers_as_source_and_destination
    assert_raises(RuntimeError){
      wrong_type_source = Permission.new(1,@another_lawyer, @case_document)
    }
    assert_raises(RuntimeError){
      wrong_type_destination = Permission.new(@lawyer, 1, @case_document)
    }
  end

  def test_permission_has_a_case_document
    assert_equal @case_document, @permission.case_document
  end

  def test_permission_of_a_case_document_is_given_by_case_owner
    assert_equal @case_document.owner, @lawyer
    assert_raises(RuntimeError){
      wrong_permission = Permission.new(@another_lawyer, @lawyer, @case_document)
    }
  end
end