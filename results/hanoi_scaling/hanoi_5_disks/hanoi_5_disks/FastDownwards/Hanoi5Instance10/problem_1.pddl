(define (problem hanoi5instance10)
  (:domain hanoi-5)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ;; Initial tower on the left peg (top -> bottom): A B C D E
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-peg E left)

    ;; Only the topmost disk is clear; the other pegs are empty (clear)
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; Size ordering: A < B < C < D < E
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal
    (and
      ;; Goal: entire tower moved to the right peg (top -> bottom): A B C D E
      (on-disk A B)
      (on-disk B C)
      (on-disk C D)
      (on-disk D E)
      (on-peg E right)

      ;; left and middle pegs empty
      (clear-peg left)
      (clear-peg middle)
    )
  )
)