class Log < ActiveRecord::Base
  validates :key, uniqueness: { scope: :message }, presence: true
  validates :message, uniqueness: { scope: :key }, presence: true

  default_scope { order(created_at: :desc) }
  paginates_per 50

  def self.not_found(message)
    create(key: 'Not Found', message: message)
  end

  def self.error_report(message)
    create(key: 'Error Report', message: message)
  end
end
