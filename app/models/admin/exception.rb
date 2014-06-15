class Admin::Exception < ActiveRecord::Base
  serialize :backtrace, Array
end
