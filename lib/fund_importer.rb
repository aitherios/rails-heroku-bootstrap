# encoding: utf-8

require 'csv'

FundData = Struct.new(:name, :manager_name)

class FundImporter
  def self.import_from_csv(file_path)
    self.new.import_from_csv(file_path)
  end
  
  def all_fund_data
    @all_fund_data ||= []
  end
  
  def import_from_csv(file_path)
    CSV.foreach(file_path, headers: true) do |fund_data|
      fund_name = fund_data['nome']
      fund_mananger_name = fund_data['administradora']
      
      all_fund_data << FundData.new(fund_name, fund_mananger_name)
      manager = FundManager.find_or_create_by_name(fund_mananger_name)
      
      fund = Fund.where(name: fund_name, fund_manager_id: manager.id).first || Fund.new
      
      fund.update_attributes!({name: fund_name,
                              manager: manager,
                              leveraged: fund_data['alavancado'] =~ /Sim|Não/ ? fund_data['alavancado'] : 'Não consta',
                              type: FundType.find_or_create_by_name(fund_data['classificacao']),
                              minimum_investiment: string_to_number(fund_data['aplicmin']),
                              management_fee: string_to_number(fund_data['txadm']),
                              daily_return: string_to_number(fund_data['rentdia']),
                              monthly_return: string_to_number(fund_data['rentmes']),
                              anual_return: string_to_number(fund_data['rentano']),
                              net_worth: string_to_number(fund_data['pl']),
                              start_date: Date.strptime(fund_data['inicio'], '%m/%d/%Y')},
                              without_protection: true)
    end
    
    destroy_all_funds_not_found_on_CSV
  end
  
  def string_to_number(string)
    string.delete('R$,%') if is_numeric?(string.delete('R$,%'))
  end
  
  def is_numeric?(string)
    Float(string)
    true 
  rescue 
    false
  end
  
  def destroy_all_funds_not_found_on_CSV
    Fund.all.each do |fund|
      fund.destroy if all_fund_data.select {|fund_data| fund_data.name == fund.name and fund_data.manager_name == fund.manager.name}.empty? 
    end
  end
end