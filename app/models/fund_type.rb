class FundType < ActiveRecord::Base
  has_many :funds
  attr_accessible :name
  
  def self.empty
    includes('funds').where('funds.id IS NULL')
  end
end
