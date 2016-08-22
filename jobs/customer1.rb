customer1s = ['Total Power Consumption', 'Total Load', 'Total Current']
customer1_counts = Hash.new({ value: 0 })

SCHEDULER.every '5s' do
  random_customer1 = customer1s.sample
  customer1_counts[random_customer1] = { label: random_customer1, value: (customer1_counts[random_customer1][:value] + 1) % 100 }

  send_event('customer1', { items: customer1_counts.values })
end
