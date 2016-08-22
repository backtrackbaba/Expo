customer2s = ['Total Power Consumption', 'Total Load', 'Total Current']
customer2_counts = Hash.new({ value: 0 })

SCHEDULER.every '5s' do
  random_customer2 = customer2s.sample
  customer2_counts[random_customer2] = { label: random_customer2, value: (customer2_counts[random_customer2][:value] + 1) % 100 }

  send_event('customer2', { items: customer2_counts.values })
end
