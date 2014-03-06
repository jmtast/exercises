# in model/case_document.rb

class CaseDocument
  def initialize (owner)
    @owner = owner
  end

  def get_owner
    @owner
  end
end