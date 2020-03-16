class Requirement < ActiveRecord::Base
  has_many :data_functions
  has_many :transactional_functions
end
