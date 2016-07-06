class Payment < ActiveRecord::Base
  belongs_to :entry
end
