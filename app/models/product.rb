class Product < ActiveRecord::Base
  serialize :actresses,     Hash
  serialize :actress_types, Array
  serialize :directors,     Array
  serialize :genres,        Array
  serialize :sample_images, Array
  serialize :scenes,        Array

  validates :code, presence: true, uniqueness: true
end
