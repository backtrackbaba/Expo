generators = ['Operational Status', 'Run Time', 'Run Time since last service', 'Apparent Power', 'Voltage', 'Current', 'Frequency', 'Starter Battery Voltage','Engine Temperature', 'Generator Energy', 'Generator Load', 'Engine RPM'  ]
generator_counts = Hash.new({ value: 0 })

SCHEDULER.every '5s' do
  random_generator = generators.sample
  generator_counts[random_generator] = { label: random_generator, value: (generator_counts[random_generator][:value] + 1) % 100 }

  send_event('generator', { items: generator_counts.values })
end
