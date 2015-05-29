class Activity < ActiveRecord::Base
  ACTIVITY_TYPES = %w(shower bath toilet)
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
      "shower" => 256
      "toilet" => 2
      "bath" => 40
    },
    false => {
      "shower" => 512
      "toilet" => 4
      #bath => how much the tub is filled in gallons
    },
  }
  #???? protected or private? protected can call methods on self but read that protected ofted used with callbacks
  protected
    def convert_to_oz
      multiplier = CONVERSION_HASH[high_efficiency][activity_type]
      self.ounces = per_use * multiplier
    end
  
end

#extra
#validation for flush, laundry, dishwasher
#Conversion hash for flush, laundry, dishwasher
#add bath/faucets