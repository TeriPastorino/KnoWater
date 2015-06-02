class Activity < ActiveRecord::Base
  ACTIVITY_TYPES = %w(shower toilet bath)
  belongs_to :user
  validates :activity_type, presence: true, inclusion: {in: ACTIVITY_TYPES, allow_blank: true}
  validates :per_use, presence: true, numericality: { only_integer: true }
  validates :user, presence: true
  before_save :convert_to_oz
  #true = for high energy oz/gal
  #false = standard oz/gal
  #128 oz/gallon

  CONVERSION_HASH = {
    true => {
      "shower" => 256,
      "toilet" => 2,
      "bath" => 40
    },
    false => {
      "shower" => 512,
      "toilet" => 4,
      "bath" => 40
    },
  }

  def to_gallons
    per_day = self.ounces
  end

  def self.today
    where("created_at >=?", Time.zone.now.beginning_of_day)
  end
  
 
  protected
    def convert_to_oz
      multiplier = CONVERSION_HASH[high_efficiency][activity_type]
      self.ounces = per_use * multiplier
    end

end

#extra
#validation for toilet, laundry, dishwasher
#Conversion hash for toilet, laundry, dishwasher
#add bath/faucets