(define (problem hanoi-5-right-to-left)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ;; size ordering (smaller -> larger)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ;; initial stack on the right peg (top-to-bottom): A, B, C, D, E
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)

    ;; clear facts: true only for places with nothing directly on them
    ;; top disk A has nothing on it; left and middle pegs are empty
    (clear A)
    (clear left)
    (clear middle)
  )

  (:goal (and
    ;; final stack on the left peg (top-to-bottom): A, B, C, D, E
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ;; middle and right pegs must be empty at the end
    (clear middle)
    (clear right)
  ))