class Fund < ActiveRecord::Base
  belongs_to :manager, class_name: 'FundManager', foreign_key: 'fund_manager_id'
  belongs_to :type, class_name: 'FundType', foreign_key: 'fund_type_id'

  attr_accessible :anual_return,
                  :daily_return, 
                  :levereged, 
                  :management_fee, 
                  :minimum_investiment, 
                  :monthly_return, 
                  :name, 
                  :net_worth, 
                  :start_date
end
