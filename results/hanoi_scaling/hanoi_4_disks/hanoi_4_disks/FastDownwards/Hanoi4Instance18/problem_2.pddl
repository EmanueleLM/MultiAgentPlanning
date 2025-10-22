(define (problem Hanoi4Instance18)
  (:domain hanoi-4)
  (:objects
    A B C D - disk
    left middle right - peg
  )

  (:init
    (on D left)
    (on C D)
    (on B C)
    (on A B)

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
    (on D right)
    (on C D)
    (on B C)
    (on A B)
    (clear left)
    (clear middle)
  ))
)