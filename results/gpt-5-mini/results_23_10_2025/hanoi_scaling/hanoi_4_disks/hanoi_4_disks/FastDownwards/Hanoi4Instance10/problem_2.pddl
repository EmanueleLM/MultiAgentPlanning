(define (problem hanoi4-problem)
  (:domain hanoi-4)
  (:objects
    A B C D - disk
    left middle right - peg
  )
  (:init
    (on A left)
    (on B left)
    (on C left)
    (on D left)
  )
  (:goal (and
    (on A right)
    (on B right)
    (on C right)
    (on D right)
  ))
)