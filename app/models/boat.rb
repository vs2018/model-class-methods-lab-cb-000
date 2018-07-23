class Boat < ActiveRecord::Base
  belongs_to  :captain
  has_many    :boat_classifications
  has_many    :classifications, through: :boat_classifications
  
  def self.first_five
    self.limit(5)
  end
  
  def self.dinghy
    self.where("length < 20")

  end
  
  def self.ship
    self.where("length >= 20")

  end
  
  def self.last_three_alphabetically
    self.limit(3).order('name desc')

  end
  
  def self.without_a_captain
  self.where(captain_id: nil )



  end
  
  def self.sailboats
self.joins(:classifications).where(classifications: {name: "Sailboat"})


  end
  
  def self.with_three_classifications
        boats = ["Nacra 17", "Zodiac CZ7", "Sun Tracker Regency 254 XP3"].sort

    Classification.where
   
    self.joins(:classifications).where(classifications: {name: ["Sailboat", "Ketch", "Catamaran"]})

  end
  
  
  
  
end
