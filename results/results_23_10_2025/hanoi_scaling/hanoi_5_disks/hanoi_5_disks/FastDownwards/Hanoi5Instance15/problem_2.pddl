(define (problem Hanoi5Instance15-problem)
  (:domain hanoi5)
  (:objects
    A B C D E - disk
    left middle right - peg
  )
  (:init
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)
    (clear A)
    (clear middle)
    (clear right)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )
  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)
  ))
)