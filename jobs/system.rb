systems = ['Grid', 'Battery', 'DG', 'System Voltage', 'Grid Power(W)', 'Outside Temperature', 'Panel Temperature']
system_counts = Hash.new({ value: 0 })

SCHEDULER.every '5s' do
  random_system = systems.sample
  system_counts[random_system] = { label: random_system, value: (system_counts[random_system][:value] + 1) % 60 }

  send_event('system', { items: system_counts.values })
end
