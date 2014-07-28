class Actress < ActiveRecord::Base
  has_and_belongs_to_many :products

  validates :name, presence: true, uniqueness: true

  def self.cache_key
    count          = self.count
    max_updated_at = self.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "actresses/all-#{count}-#{max_updated_at}"
  end
end
