class FundDecorator < ApplicationDecorator
  decorates :fund

  def minimum_investiment
    h.number_to_currency(model.minimum_investiment)
  end
  
  def net_worth
    h.number_to_currency(model.net_worth)
  end
  
  def management_fee
    h.number_to_percentage(model.management_fee, precision: 2)
  end

  def daily_return
    h.number_to_percentage(model.daily_return, precision: 2)
  end

  def monthly_return
    h.number_to_percentage(model.monthly_return, precision: 2)
  end

  def anual_return
    h.number_to_percentage(model.anual_return, precision: 2)
  end

  def start_date_for_admin
    h.localize(start_date)
  end
end