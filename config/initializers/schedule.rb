require 'rufus-scheduler'

s = Rufus::Scheduler.singleton

k = 8
s.every '30s' do #cada mes (31 dias)
  i = 0
  j = 0

  for i in (0..3) #asignacion a cada apto (290)
    Pago.pruebaf(i,j, k)
     
      j = j+1
  end
  k = k+1

  if k == 13 #Hasta el mes de diciembre
    s.shutdown
  end
end




#scheduler.join