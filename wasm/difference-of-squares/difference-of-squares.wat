(module
  ;;
  ;; Calculate the square of the sum of the first N natural numbers
  ;;
  ;; @param {i32} max - The upper bound (inclusive) of natural numbers to consider
  ;;
  ;; @returns {i32} The square of the sum of the first N natural numbers
  ;;
  (func $squareOfSum (export "squareOfSum") (param $max i32) (result i32)
    (local $i   i32)
    (local $sum i32)
    (local.set $i   (i32.const 0))
    (local.set $sum (i32.const 0))

    (block (loop
       (; i++ ;)
      local.get $i
      i32.const 1
      i32.add
      local.set $i

      (; sum += i ;)
      local.get $i
      local.get $sum
      i32.add
      local.set $sum

      (; break if i == max ;)
      local.get $i
      local.get $max
      i32.eq
      br_if 1
      br 0
    ))

    (; return sum * sum ;)
    local.get $sum
    local.get $sum
    i32.mul
  )

  ;;
  ;; Calculate the sum of the squares of the first N natural numbers
  ;;
  ;; @param {i32} max - The upper bound (inclusive) of natural numbers to consider
  ;;
  ;; @returns {i32} The sum of the squares of the first N natural numbers
  ;;
  (func $sumOfSquares (export "sumOfSquares") (param $max i32) (result i32)
    (local $i   i32)
    (local $sum i32)
    (local.set $i   (i32.const 0))
    (local.set $sum (i32.const 0))

    (block (loop
       (; i++ ;)
      local.get $i
      i32.const 1
      i32.add
      local.set $i

      (; sum += i * i ;)
      local.get $i
      local.get $i
      i32.mul
      local.get $sum
      i32.add
      local.set $sum

      (; break if i == max ;)
      local.get $i
      local.get $max
      i32.eq
      br_if 1
      br 0
    ))

    (; return sum ;)
    local.get $sum
  )

  ;;
  ;; Calculate the difference between the square of the sum and the sum of the
  ;; squares of the first N natural numbers.
  ;;
  ;; @param {i32} max - The upper bound (inclusive) of natural numbers to consider
  ;;
  ;; @returns {i32} Difference between the square of the sum and the sum of the
  ;;                squares of the first N natural numbers.
  ;;
  (func (export "difference") (param $max i32) (result i32)
    (call $squareOfSum (local.get $max))
    (call $sumOfSquares (local.get $max))
    i32.sub
  )
)
