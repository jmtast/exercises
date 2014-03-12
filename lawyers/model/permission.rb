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
    new_permission = new(from, to, readonly)
    permissions[to] = [] unless permissions[to]
    permissions[to] << new_permission
    new_permission
  end

  def self.permissions
    @permissions ||= {}
  end

  def self.all
    permissions.values.flatten
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
