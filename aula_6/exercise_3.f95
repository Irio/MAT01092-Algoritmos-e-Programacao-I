program exercise_3
implicit none

real :: L, n
real :: initial_value = 0, piece, current_piece

  print *, '# Give me a value for L:'
  read  *, L
  print *, '# Tell me in how many pieces I will divide L:'
  read  *, n

  initial_value = 0
  piece         = L / (n - 1)
  current_piece = initial_value
  print *, current_piece
  do while (current_piece < L)
    current_piece = current_piece + piece
    print *, current_piece
  end do

end program
