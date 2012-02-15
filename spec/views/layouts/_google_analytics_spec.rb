require 'spec_helper'

describe 'layouts/_google_analytics' do
  before { render }
  subject { rendered }
  it { should_not be_blank }
end
