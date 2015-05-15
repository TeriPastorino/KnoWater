class Activity < ActiveRecord::Base
  validates :activity_type, presence: true, inclusion: {in: %w(shower)}

  CONVERSION_HASH = {
    true => {
      "shower" => 128
    },
    false => {
      "shower" => 256
    }
  }

  #true = for high energy oz/gal
  #false = standard oz/gal
  #128 oz/gallon

  CONVERSION_HASH = {
    true => {
      "shower" => 256
    },
    false => {
      "shower" => 512
    }
  }

  def convert_to_oz
    multiplier = CONVERSION_HASH[high_efficiency][activity_type]
    self.ounces = per_use * multiplier
  end
end

#extra
#validation for flush, laundry, dishwasher
#Conversion hash for flush, laundry, dishwasher
#add bath/faucets