fuels = ['Remaining Fuel', 'Total Fuel Consumption']
fuel_counts = Hash.new({ value: 0 })

SCHEDULER.every '5s' do
  random_fuel = fuels.sample
  fuel_counts[random_fuel] = { label: random_fuel, value: (fuel_counts[random_fuel][:value] + 1) % 100 }

  send_event('fuel', { items: fuel_counts.values })
end
