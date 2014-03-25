program exercise_2
implicit none

real :: PI, arc

PI = acos(-1.)

arc = PI/10
print *, '# sin(PI/10)'
print *, 'Taylor series:', sin_taylor_series(arc), 'Fortran intrinsic: ', sin(arc)
arc = PI/5
print *, '# sin(PI/5)'
print *, 'Taylor series:', sin_taylor_series(arc), 'Fortran intrinsic: ', sin(arc)
arc = PI/2
print *, '# sin(PI/2)'
print *, 'Taylor series:', sin_taylor_series(arc), 'Fortran intrinsic: ', sin(arc)

contains
  real function sin_taylor_series(x) result (sin_result)
    real, intent(in) :: x
    sin_result = x - x**3/factorial(3) + x**5/factorial(5) - x**7/factorial(7) + x**9/factorial(9)
  end function

  recursive integer function factorial(n) result (factorial_result)
  integer, intent(in) :: n
    if (n == 1) then
      factorial_result = n
    else
      factorial_result = n * factorial(n - 1)
    end if
  end function
end program
