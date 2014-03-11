# in model/permission.rb

class Permission
  @@permissions = []

  def initialize (source, destination, case_document)
    if (source.instance_of?(Lawyer) && destination.instance_of?(Lawyer))
      if (case_document.owner == source)
        @source = source
        @destination = destination
        @case_document = case_document
        @with_total_access = [@source, @destination]
        @with_read_access = [@source, @destination]
        @@permissions << self
      else
        raise 'Only the case owner can give case permissions.'
      end
    else
      raise 'Objects giving and receiving permissions must be of class Lawyer'
    end
  end

  def self.all
    @@permissions
  end

  attr_accessor :source, :destination, :case_document, :with_total_access, :with_read_access
end
