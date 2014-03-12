# in model/permission.rb

class Permission
  attr :readonly

  def initialize(readonly)
    @readonly = readonly
  end
end

class GlobalPermission < Permission
  attr :from, :to

  def initialize(from, to, readonly)
    super(readonly)
    @from = from
    @to = to
  end

  def self.create(from, to, readonly = true)
    permissions[to] = [] unless permissions[to]
    permissions[to] << [from, readonly]
    new(from, to, readonly)
  end

  def self.permissions
    @permissions ||= {}
  end

  def self.all
    result = []
    permissions.each_pair do |key, value|
      value.each {|from| result << GlobalPermission.new(from.first, key, from.last)}
    end
    result
  end
end
 
class SinglePermission < Permission
end
 
class GrantedGlobalPermission < GlobalPermission
end
 
class DeniedGlobalPermission < GlobalPermission
end
 
class GrantedSinglePermission < SinglePermission
end
 
class DeniedSinglePermission < SinglePermission
end