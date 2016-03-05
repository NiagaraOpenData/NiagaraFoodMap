class Foodbank < ActiveRecord::Base
  serialize :info, JSON

  reverse_geocoded_by :latitude, :longitude
end
