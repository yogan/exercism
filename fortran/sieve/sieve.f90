module sieve
   implicit none

contains

   function primes(limit) result(array)
      integer, intent(in) :: limit
      integer, allocatable :: array(:)
      integer :: i, j
      logical :: is_prime(limit)

      is_prime = [(.true., i=1, limit)]
      is_prime(1) = .false.

      do i = 2, limit
         if (is_prime(i)) then
            do j = i + i, limit, i
               is_prime(j) = .false.
            end do
         end if
      end do

      array = pack([(i, i=1, limit)], is_prime)

   end function primes

end module sieve
