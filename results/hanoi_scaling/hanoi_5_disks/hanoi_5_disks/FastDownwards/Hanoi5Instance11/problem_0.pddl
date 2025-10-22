(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ;; Initial stack on left (top->bottom A B C D E)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ;; Clear facts: only the top disk (A) is clear, middle and right pegs are empty (clear).
    (clear A)
    (clear middle)
    (clear right)

    ;; Size ordering (smaller relations)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal
    (and
      ;; Goal stack on right (top->bottom A B C D E)
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E right)

      ;; Left and middle pegs empty
      (clear left)
      (clear middle)
    )
  )
)