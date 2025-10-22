(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left peg, top-to-bottom: A,B,C,D,E
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ;; clear objects: top disk A, and empty pegs middle and right
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering: A smallest, E largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )
  (:goal (and
    ;; goal stack on right peg, top-to-bottom: A,B,C,D,E
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)
  ))
)