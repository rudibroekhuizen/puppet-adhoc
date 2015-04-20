require 'spec_helper'
describe 'adhoc' do

  context 'with defaults for all parameters' do
    it { should contain_class('adhoc') }
  end
end
