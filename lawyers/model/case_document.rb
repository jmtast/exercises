# in model/case_document.rb

class CaseDocument
  def initialize (owner)
    @owner = owner
  end

  attr_accessor :owner
end