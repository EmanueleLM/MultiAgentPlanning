(define (problem hanoi4-problem)
  (:domain hanoi-4)
  (:objects
    a b c d - disk
    left middle right - peg
  )
  (:init
    (on a left)
    (on b left)
    (on c left)
    (on d left)
  )
  (:goal (and
    (on a right)
    (on b right)
    (on c right)
    (on d right)
  ))
)