# in model/permission.rb

class Permission
  def initialize (source, destination, case_document)
    if source.instance_of? Lawyer && destination.instance_of? Lawyer
      if (case_document.get_owner == source)
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

  def get_source
    @source
  end

  def get_destination
    @destination
  end

  def get_case_document
    @case_document
  end  
end