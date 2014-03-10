# in model/permission.rb

class Permission
  def initialize (source, destination, case_document)
    if (source.instance_of?(Lawyer) && destination.instance_of?(Lawyer))
      if (case_document.owner == source)
        @source = source
        @destination = destination
        @case_document = case_document
      else
        raise 'Only the case owner can give case permissions.'
      end
    else
      raise 'Objects giving and receiving permissions must be of class Lawyer'
    end
  end

  attr_accessor :source, :destination, :case_document
end