class Product < ActiveRecord::Base
  def self.search(query)
    product = self.where("? = ANY (aliases)", query).take
    return product if product
    details = OpenDMM.search(query)
    return nil unless details
    product = Product.find_by_code(details[:code]) ||
              Product.new(details)
    product.aliases << query
    product.aliases_will_change!
    product.save ? product : nil
  end

  def to_param
    code
  end

  def refresh!
    @details = OpenDMM.search(code)
    update!(@details)
  end
end
