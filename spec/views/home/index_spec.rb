require 'spec_helper'

describe 'home/index' do
  before { render }
  subject { rendered }
  it { should_not be_blank }
end
