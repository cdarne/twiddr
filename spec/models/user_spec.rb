require 'spec_helper'

describe User, 'valid' do
  it { should validate_presence_of :twiddr_name }
end
