module sieve
   implicit none

contains

   function primes(limit) result(array)
      integer, intent(in) :: limit
      integer :: i, j
      integer, allocatable :: array(:), sieve(:)

      allocate (sieve(limit))

      do i = 2, limit
         sieve(i) = i
      end do

      do i = 2, limit
         if (sieve(i) /= 0) then
            do j = i + i, limit, i
               sieve(j) = 0
            end do
         end if
      end do

      j = 0
      do i = 2, limit
         if (sieve(i) /= 0) then
            j = j + 1
         end if
      end do

      allocate (array(j))

      j = 0
      do i = 2, limit
         if (sieve(i) /= 0) then
            j = j + 1
            array(j) = sieve(i)
         end if
      end do

   end function primes

end module sieve
