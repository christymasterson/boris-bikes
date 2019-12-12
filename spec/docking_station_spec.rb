require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#dock' do
    it 'raises an error when docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock(Bike.new)
      end
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end

  describe '#release_bike' do
    it 'raises an error where there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end


  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

end
