class Product < ActiveRecord::Base
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
    @details = OpenDMM.search(code)
    update!(@details)
  end
end
