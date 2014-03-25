program exercise_1
implicit none

integer, parameter               :: N = 5
integer, parameter, dimension(5) :: x = (/0, 1, 1, 2, 3/)
integer, parameter, dimension(6) :: y = (/-1, 0, 1, 1, 0, -1/)
integer            :: i
real, dimension(3) :: a = (/0., -1., 7**(1./3)/)

do i = 1, 3
  print *, 'Result = ', summation(a(i))
end do

contains
  real function summation(a) result (sum_result)
  integer          :: i
  real, intent(in) :: a
    sum_result = 0

    do i = 1, N
      sum_result = sum_result + (x(i) * (a - y(i + 1)))
    end do
  end function summation
end program
