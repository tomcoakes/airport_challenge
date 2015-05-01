require 'capybara/rspec'

## Note these are just some guidelines!
## Feel free to write more tests!!

# Given 6 planes, each plane must land.
# Be careful of the weather, it could be stormy!
# Check when all the planes have landed that they have status "landed"
# Once all planes are in the air again, check that they have status "flying!"

feature 'Grand Finale' do

  let(:airport) { Airport.new }
  let(:six_planes) { Array.new(6, Plane.new) }

  scenario 'all planes can land and all planes can take off' do
    six_planes.each { |plane| airport.land(plane) }
    expect(airport.planes.count).to eq 6
    six_planes.each { |plane| expect(plane).not_to be_flying }
    six_planes.each { |plane| airport.take_off(plane) }
    expect(airport.planes).to be_empty
    six_planes.each { |plane| expect(plane).to be_flying }
  end

end