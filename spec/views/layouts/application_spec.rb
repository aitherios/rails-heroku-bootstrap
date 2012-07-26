require 'spec_helper'

describe 'layouts/application' do
  before { render }
  subject { rendered }
  it { should_not be_blank }
end
