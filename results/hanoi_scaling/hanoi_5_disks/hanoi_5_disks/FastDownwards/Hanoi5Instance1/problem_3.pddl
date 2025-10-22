(define (problem hanoi5-instance1)
  (:domain hanoi5)
  (:objects
    a b c d e - disk
    left middle right - peg
  )

  (:init
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e left)

    (top a left)

    (clear-disk a)
    (clear-peg middle)
    (clear-peg right)

    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)
  )

  (:goal (and
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e right)
    (clear-peg left)
    (clear-peg middle)
  ))
)