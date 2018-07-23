class Captain < ActiveRecord::Base
  has_many :boats
  
  def self.catamaran_operators
    self.joins(boats: :classifications).where(classifications: {name: "Catamaran"})

  end
  
  def self.sailors
    self.joins(boats: :classifications).where(classifications: {name: "Sailboat"}).uniq

  end
  
   def self.motorboat_operators
    includes(boats: :classifications).where(classifications: {name: "Motorboat"})
  end
  
  def self.talented_seafarers
    # data = ["Sailboat", "Motorboat"]
    #     self.joins(boats: :classifications).where("classifications.name = ? OR classifications.name = ?", data[0], data[1])
        
            where("id IN (?)", self.sailors.pluck(:id) & self.motorboat_operators.pluck(:id))


  end
  
  def self.non_sailors
    where.not
    
  end
  
  
end
