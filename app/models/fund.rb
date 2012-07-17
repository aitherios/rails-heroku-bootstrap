class Fund < ActiveRecord::Base
  belongs_to :manager, class_name: 'FundManager', foreign_key: 'fund_manager_id'
  belongs_to :type, class_name: 'FundType', foreign_key: 'fund_type_id'
  
  validates :name,
            :manager,
            :minimum_investiment,
            :management_fee,
            :daily_return,
            :monthly_return,
            :anual_return,
            presence: true
end
