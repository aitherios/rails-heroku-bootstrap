# encoding: utf-8

require 'spec_helper'

describe FundImporter do
  describe '.import_from_csv(file_path)' do
    context "CSV with 2 new funds for the first time" do
      before  do
        FundImporter.import_from_csv('spec/fixtures/2-new-funds.csv')
      end

      it 'creates 2 Funds from CSV' do
        Fund.count.should == 2
      end

      it 'creates each fund with the correct attributes' do
        first_fund = Fund.first
        first_fund.name.should == 'BB CIELO FI AÇÕES'
        first_fund.manager.name.should == 'BB Gestão de Recursos DTVM'
        first_fund.leveraged.should == 'Não'
        first_fund.type.name.should == 'Ações Setoriais'
        first_fund.minimum_investiment.should == 300
        first_fund.management_fee.should == 1.5
        first_fund.daily_return.should == 2.68
        first_fund.monthly_return.should == 10.64
        first_fund.anual_return.should == 44.46
        first_fund.net_worth.should == 99_715_244.38
        first_fund.start_date.should == Date.new(2009, 6, 30)

        last_fund = Fund.last
        last_fund.name.should == 'BRADESCO CIELO FI AÇÕES'
        last_fund.manager.name.should == 'Banco Bradesco'
        last_fund.leveraged.should == 'Não'
        last_fund.type.name.should == 'Ações Setoriais'
        last_fund.minimum_investiment.should == 300
        last_fund.management_fee.should == 1.5
        last_fund.daily_return.should == 2.68
        last_fund.monthly_return.should == 10.72
        last_fund.anual_return.should == 44.34
        last_fund.net_worth.should == 52_567_779.46
        last_fund.start_date.should == Date.new(2009, 6, 17)
      end
    end
    
    context "CSV with 1 new Fund and 1 Fund that already exists" do
      before do
        Fund.create({name: 'BB CIELO FI AÇÕES',
                    manager: FundManager.find_or_create_by_name('BB Gestão de Recursos DTVM'),
                    leveraged: false,
                    type: FundType.find_or_create_by_name('Ações Setoriais'),
                    minimum_investiment: 300,
                    management_fee: 1.5,
                    daily_return: 2.68,
                    monthly_return: 10.64,
                    anual_return: 44.46,
                    net_worth: 99_715_244.38,
                    start_date: Date.new(2009, 6, 30)},
                    without_protection: true)
        
        FundImporter.import_from_csv('spec/fixtures/1-new-fund-and-1-existent-fund.csv')
      end
      
      it 'adds the new Fund with correct attributes' do
        Fund.count.should == 2
        
        new_fund = Fund.last
        new_fund.name.should == 'BRADESCO CIELO FI AÇÕES'
        new_fund.manager.name.should == 'Banco Bradesco'
        new_fund.leveraged.should == 'Não'
        new_fund.type.name.should == 'Ações Setoriais'
        new_fund.minimum_investiment.should == 300
        new_fund.management_fee.should == 1.5
        new_fund.daily_return.should == 2.68
        new_fund.monthly_return.should == 10.72
        new_fund.anual_return.should == 44.34
        new_fund.net_worth.should == 52_567_779.46
        new_fund.start_date.should == Date.new(2009, 6, 17)
      end
      
      it 'updates the Fund that already exists' do
        updated_fund = Fund.first
        updated_fund.name.should == 'BB CIELO FI AÇÕES'
        updated_fund.manager.name.should == 'BB Gestão de Recursos DTVM'
        updated_fund.leveraged.should == 'Não'
        updated_fund.type.name.should == 'Ações Setoriais'
        updated_fund.minimum_investiment.should == 450.47 # udpated
        updated_fund.management_fee.should == 1.3 # udpated
        updated_fund.daily_return.should == 2.68
        updated_fund.monthly_return.should == 10.64
        updated_fund.anual_return.should == 44.46
        updated_fund.net_worth.should == 99_715_244.38
        updated_fund.start_date.should == Date.new(2009, 6, 30)
      end
    end
    
    context "CSV with 2 new Funds and database with 1 Fund that doesn't match" do
      before do
        Fund.create({name: 'Fund that does not exist in the CSV',
                    manager: FundManager.find_or_create_by_name('BB Gestão de Recursos DTVM'),
                    leveraged: false,
                    type: FundType.find_or_create_by_name('Ações Setoriais'),
                    minimum_investiment: 300,
                    management_fee: 1.5,
                    daily_return: 2.68,
                    monthly_return: 10.64,
                    anual_return: 44.46,
                    net_worth: 99_715_244.38,
                    start_date: Date.new(2009, 6, 30)},
                    without_protection: true)
        
        FundImporter.import_from_csv('spec/fixtures/2-new-funds.csv')
      end

      it 'creates 2 Funds from CSV' do
        Fund.count.should == 2
        Fund.first.name.should == 'BB CIELO FI AÇÕES'
        Fund.last.name.should == 'BRADESCO CIELO FI AÇÕES'
      end
    
      it "destroys fund if it's not in csv" do
        Fund.find_by_name('Fund that does not exist in the CSV').should be_nil
      end
    end
    
    context "CSV with 1 new Fund with invalid leveraged" do
      before do
        FundImporter.import_from_csv('spec/fixtures/1-new-fund-with-invalid-leveraged.csv')
      end
      
      it "creates with leveraged = 'Não consta'" do
        Fund.first.leveraged.should == 'Não consta'
      end
    end
  end
end