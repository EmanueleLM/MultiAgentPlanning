(define (problem hanoi-4-instance)
  (:domain hanoi)
  (:objects
    a b c d - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left peg: a (top) on b on c on d on left
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg d left)

    ;; clear/top markers: only 'a' is top initially; middle and right pegs empty
    (clear-disk a)
    (clear-peg middle)
    (clear-peg right)

    ;; size ordering: a < b < c < d (explicit pairs)
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)
  )
  (:goal (and
    ;; goal: same stack order on right peg (a top)
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg d right)
  ))
)