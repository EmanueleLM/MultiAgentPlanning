(define (problem hanoi-4)
  (:domain hanoi-domain)
  (:objects
    A B C D - disk
    left middle right - peg
  )
  (:init
    (on A B)
    (on B C)
    (on C D)
    (on D left)
    (clear A)
    (clear middle)
    (clear right)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D right)
  ))
)