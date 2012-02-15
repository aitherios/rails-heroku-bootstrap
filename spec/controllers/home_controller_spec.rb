require 'spec_helper'

describe HomeController do

  context 'GET index' do
    before { get :index }
    it { should respond_with :success }
  end

end
