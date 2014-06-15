class Product < ActiveRecord::Base
  serialize :actresses,     Array
  serialize :actress_types, Array
  serialize :categories,    Array
  serialize :directors,     Array
  serialize :genres,        Array
  serialize :sample_images, Array
  serialize :scenes,        Array

  before_validation do self.code.upcase! end
  validates :code, presence: true, uniqueness: true

  def self.fuzzy_find(code)
    Product.find_by(code: code.upcase) ||
    Product.find_by(code: code.remove(/[-_]/).upcase)
  end

  def to_param
    code
  end

  def refresh!
    return if updated_at >= 1.hour.ago
    @details = OpenDMM.search(code)
    update!(@details)
  end
end
