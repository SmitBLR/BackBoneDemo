class Employee < ActiveRecord::Base
  validates_presence_of :name, :age
  validates_numericality_of :age, :only_integer => true, :greater_than_or_equal_to => 18, :less_than_or_equal_to => 65
end
