class Map < ApplicationRecord
  belongs_to :route

  validates :latitude, :longitude, presence: true
  validates :latitude,
            numericality: {
              greater_than_or_equal_to: BigDecimal(-90),
              less_than_or_equal_to: BigDecimal(90)
            }
  validates :longitude,
            numericality: {
              greater_than_or_equal_to: BigDecimal(-180),
              less_than_or_equal_to: BigDecimal(180)
            }
end
