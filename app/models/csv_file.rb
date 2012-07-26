class CsvFile < ActiveRecord::Base
  attr_accessible :file
  mount_uploader :file, CsvUploader
  
  validates :file, presence: true
end
