class Captain < ActiveRecord::Base
  has_many :boats
  
  def self.catamaran_operators
    self.joins(boats: :classifications).where(classifications: {name: "Catamaran"})

  end
  
  def self.sailors
    self.joins(boats: :classifications).where(classifications: {name: "Sailboat"}).uniq

  end
  
  def self.talented_seafarers
    data = ["Sailboat", "Motorboat"]
        self.joins(boats: :classifications).where(classifications: {"name IN (?)", data})

  end
  
  def self.non_sailors
    
  end
  
  
end
