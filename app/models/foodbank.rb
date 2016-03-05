class Foodbank < ActiveRecord::Base
  serialize :info, JSON
end
