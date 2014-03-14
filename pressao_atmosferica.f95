program pressao_atmosferica
implicit none

real :: rho, t, p, g, h
real, parameter :: m  = .0289644
real, parameter :: r  = 8.31447
real, parameter :: p0 = 101325
real, parameter :: t0 = 288.15
real, parameter :: l  = .0065
real, parameter :: re = 6371
	
  !h = 0
  h = 1000

  g   = 9.80665 * (re / (re + h)) ** 2
  p   = p0 * (1 - (l * h) / t0) ** ((g * m) / (r * l))
  t   = t0 - l * h
  rho = (p * m) / (r * t)

  print *, 'Density: ',     rho,             ' kg/m**3'
  print *, 'Temperature: ', t_in_celcius(t), ' C'
  print *, 'Pressure: ',    p,               ' Pa'

contains
  real function t_in_celcius(t_in_kelvin) result (t)
  real, intent(in) :: t_in_kelvin
    t = t_in_kelvin - 273.15
  end function t_in_celcius
end program
