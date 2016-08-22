rectifiers = ['Output Voltage', 'Output Rectifier Current', 'Total Load Current', 'Total rectifier Current', 'Voltage Phase 1', 'Power Load']
rectifier_counts = Hash.new({ value: 0 })

SCHEDULER.every '5s' do
  random_rectifier = rectifiers.sample
  rectifier_counts[random_rectifier] = { label: random_rectifier, value: (rectifier_counts[random_rectifier][:value] + 1) % 100 }

  send_event('rectifier', { items: rectifier_counts.values })
end
