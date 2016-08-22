batterys = ['Charge Cycles', 'Charge Status', 'Charge Duration(hrs)', 'Battery Temperature']
battery_counts = Hash.new({ value: 0 })

SCHEDULER.every '5s' do
  random_battery = batterys.sample
  battery_counts[random_battery] = { label: random_battery, value: (battery_counts[random_battery][:value] + 1) % 100 }

  send_event('battery', { items: battery_counts.values })
end
