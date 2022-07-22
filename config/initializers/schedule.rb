require 'rufus-scheduler'

s = Rufus::Scheduler.singleton
i = 0
j = 0
s.every '3s' do
  Pago.pruebaf(i,j)
  i = i+1
  j = j+1
end

#scheduler.join