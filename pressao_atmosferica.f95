program pressao_atmosferica
implicit none

real :: rho, T, p, g, h
real, parameter :: M  = .0289644 ! Molar mass of dry air
real, parameter :: R  = 8.31447  ! Universal gas constant
real, parameter :: p0 = 101325   ! Sea level standard atmospheric pressure
real, parameter :: T0 = 288.15   ! Sea level standard temperature
real, parameter :: L  = .0065    ! Temperature lapse rate
real, parameter :: RE = 6371     ! Earth's mean radius
	
  print *, '# To calculate density/temperature/pressure I need a height(m):'
  read  *, h

  g   = 9.80665 * (RE / (RE + h)) ** 2                 ! Earth gravitational acceleration
  p   = p0 * (1 - (L * h) / T0) ** ((g * M) / (R * L)) ! Pressure
  T   = T0 - L * h                                     ! Absolute temperature
  rho = (p * M) / (R * T)                              ! Density of gas

  print *, 'Density: ',     rho,             ' kg/m^3'
  print *, 'Temperature: ', t_in_celcius(t), ' ºC'
  print *, 'Pressure: ',    p,               ' Pa'

contains
  real function t_in_celcius(t_in_kelvin) result (t)
  real, intent(in) :: t_in_kelvin
    t = t_in_kelvin - 273.15
  end function t_in_celcius
end program
