# in model/lawyer.rb

class Lawyer
  @@lawyers = []

  def initialize (name)
    @name = name
    @@lawyers.push(self)
  end

  def self.all
    @@lawyers
  end

  attr_accessor :name
end