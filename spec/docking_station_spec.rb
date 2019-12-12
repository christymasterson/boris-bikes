require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe '#dock' do
    it 'raises an error when docking station is full' do
      subject.capacity.times do
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
    describe '#release_bike' do

    it 'raises an error when we try to release a broken bike' do
      docking_station = DockingStation.new(1)
      bike = Bike.new
      broken_bike = bike.report_broken
      docking_station.dock(broken_bike)
      expect { docking_station.release_bike }.to raise_error 'This bike is broken'
    end
  end



  it { is_expected.to respond_to(:dock).with(1).argument }

  # it { is_expected.to respond_to(:bikes) }

  it 'returns docked bikes' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  describe '#capacity' do
    it 'has a capacity method' do
      docking_station = DockingStation.new
      expect(docking_station).to respond_to(:capacity)
    end

    it 'has a default capacity of 20' do
      docking_station = DockingStation.new
      default_capacity = docking_station.capacity
      expect(default_capacity).to eq(20)
    end

    it 'has a variable capacity' do
      docking_station = DockingStation.new(50)
      50.times { docking_station.dock Bike.new }
      expect { docking_station.dock Bike.new }.to raise_error 'Docking station full'
    end
  end

end
