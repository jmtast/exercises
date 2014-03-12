# in test/permission_test.rb

gem 'minitest'
require 'minitest/autorun'
require_relative '../model/lawyer'
require_relative '../model/case_document'
require_relative '../model/permission'

class TestPermission < MiniTest::Unit::TestCase

end

class TestGlobalPermission < MiniTest::Unit::TestCase
  def setup
    @from = Lawyer.new('from')
    @to = Lawyer.new('to')
  end

  def test_new_receives_from_to_and_readonly
    global_permission = GlobalPermission.new(@from, @to, true)

    assert_equal @from, global_permission.from
    assert_equal @to, global_permission.to
    assert global_permission.readonly
  end

  def test_create_returns_new_global_permission
    assert_kind_of GlobalPermission, GlobalPermission.create(@from, @to)
  end

  def test_readonly_is_true_by_default
    assert GlobalPermission.create(@from, @to).readonly
    refute GlobalPermission.create(@from, @to, false).readonly
  end

  def test_global_permissions_can_be_listed
    GlobalPermission.create(@from, @to)
    assert GlobalPermission.all.any? {|global_permission| global_permission.from == @from && global_permission.to == @to && global_permission.readonly}
  end
end
