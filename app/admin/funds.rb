# encoding: utf-8

require 'fund_importer'

ActiveAdmin.register Fund do
  form partial: 'form'
  
  index do
    column :id
    column :name
    column :manager, sortable: false
    column 'Alv.', :leveraged
    column 'Classific.', :type, sortable: false
    column 'Aplicação Mín.', :minimum_investiment, sortable: :minimum_investiment do |fund|
      FundDecorator.decorate(fund).minimum_investiment
    end
    column 'Taxa Adm.', :management_fee, sortable: :management_fee do |fund|
      FundDecorator.decorate(fund).management_fee
    end
    column 'R. Diária', :daily_return, sortable: :daily_return do |fund|
      FundDecorator.decorate(fund).daily_return
    end
    column 'R. Mensal', :monthly_return, sortable: :monthly_return do |fund|
      FundDecorator.decorate(fund).monthly_return
    end
    column 'R. Anual', :anual_return, sortable: :anual_return do |fund|
      FundDecorator.decorate(fund).anual_return
    end
    column :net_worth, sortable: :net_worth do |fund|
      FundDecorator.decorate(fund).net_worth
    end
    column :start_date, sortable: :start_date do |fund|
      FundDecorator.decorate(fund).start_date_for_admin
    end
    
    default_actions
  end
  
  collection_action :import_csv, :method => :post do
    csv = CsvFile.new(params[:import_csv])
    if csv.valid?
      csv.save
      FundImporter.import_from_csv(Rails.root.join("public#{csv.file.url}"))
      redirect_to action: :index
    else
      redirect_to action: :new
    end
  end
end
