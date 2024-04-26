class Restaurant < ApplicationRecord
  validates :rating, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 4
  }

  def self.statistics(longitude, latitude, z)
    restaurants_statistics = {
      "count": 0,
      "avg": 0.0,
      "std": 0.0
    }
    rating = []
    Restaurant.all.each do |restaurant|
      # /restaurants/statistics?latitude=x&longitude=y&radius=z
      x_latitude = (restaurant.lat - latitude.to_f)**2
      y_longitude = (restaurant.lng - longitude.to_f)**2
      if (x_latitude + y_longitude) <= z.to_f**2
        restaurants_statistics[:count] += 1
        rating.append(restaurant.rating)
      end
    end
    standard_deviation(restaurants_statistics, rating) if !rating.empty?
    restaurants_statistics
  end

  def self.standard_deviation(restaurants_statistics, rating)
    avg = rating.sum / rating.length.to_f
    sum_of_squares = rating.map { |x| (x - avg)**2 }.sum
    variance = sum_of_squares / rating.length
    standard_deviation = Math.sqrt(variance)
    restaurants_statistics[:avg] = avg
    restaurants_statistics[:std] = standard_deviation
  end
end
