class Product < ActiveRecord::Base
  serialize :actresses,     Array
  serialize :actress_types, Array
  serialize :categories,    Array
  serialize :directors,     Array
  serialize :genres,        Array
  serialize :sample_images, Array
  serialize :scenes,        Array

  validates :code, presence: true, uniqueness: true

  before_save do self.code.upcase! end

  def self.fuzzy_find(code)
    Product.find_by(code: code.upcase) ||
    Product.find_by(code: code.remove(/[-_]/).upcase)
  end
end
