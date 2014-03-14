program air_information
implicit none

real :: rho, T, p, g, h
real, parameter :: M  = .0289644 ! Molar mass of dry air
real, parameter :: R  = 8.31447  ! Universal gas constant
real, parameter :: p0 = 101325   ! Sea level standard atmospheric pressure
real, parameter :: T0 = 288.15   ! Sea level standard temperature
real, parameter :: L  = .0065    ! Temperature lapse rate
real, parameter :: RE = 6371     ! Earth's mean radius

interface
  real function t_in_celcius(t_in_kelvin) result (t)
    real, intent(in) :: t_in_kelvin
  end function t_in_celcius
end interface

	
  print *, '# To calculate density/temperature/pressure I need a height(m):'
  read  *, h

  g   = earth_gravitational_acceleration(h)
  p   = atmospheric_pressure(h, g)
  T   = absolute_temperature(h)
  rho = density_of_gas(p, T)

  print *, 'Density: ',     rho,             ' kg/m^3'
  print *, 'Temperature: ', t_in_celcius(t), ' ºC'
  print *, 'Pressure: ',    p,               ' Pa'

contains
  real function earth_gravitational_acceleration(h) result (g)
  real, intent(in) :: h
    g = 9.80665 * (RE / (RE + h)) ** 2
  end function earth_gravitational_acceleration

  real function atmospheric_pressure(h, g) result (p)
  real, intent(in) :: g, h
    p = p0 * (1 - (L * h) / T0) ** ((g * M) / (R * L))
  end function atmospheric_pressure

  real function absolute_temperature(h) result (T)
  real, intent(in) :: h
    T = T0 - L * h
  end function absolute_temperature

  real function density_of_gas(p, T) result (rho)
  real, intent(in) :: p, T
    rho = (p * M) / (R * T)
  end function density_of_gas
end program

real function t_in_celcius(t_in_kelvin) result (t)
real, intent(in) :: t_in_kelvin
  t = t_in_kelvin - 273.15
end function t_in_celcius
