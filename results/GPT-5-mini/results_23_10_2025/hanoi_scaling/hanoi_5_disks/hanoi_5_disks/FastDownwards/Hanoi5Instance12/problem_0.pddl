(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    a b c d e - disk
    peg_left peg_mid peg_right - peg
  )
  (:init
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e peg_left)

    (clear a)
    (clear peg_mid)
    (clear peg_right)

    (larger e d) (larger e c) (larger e b) (larger e a)
    (larger d c) (larger d b) (larger d a)
    (larger c b) (larger c a)
    (larger b a)
  )
  (:goal (and
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e peg_right)
  ))
)