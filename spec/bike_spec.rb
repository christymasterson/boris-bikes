require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }



  # it { is_expected.to raise_error "No bikes available" }

end
