(define (problem hanoi-5)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left peg: top A, then B, then C, then D, then E on peg
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E left)

    ;; clear predicates: only the top disk A and the empty pegs middle and right are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; size order: A < B < C < D < E (transitively encoded as pairwise smaller)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal (and
    ;; final stack on right peg: top A, then B, then C, then D, then E on peg
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)

    ;; left and middle pegs must be empty in the goal (no disk directly on them)
    (clear left)
    (clear middle)
    ;; top disk A must be clear (top of the tower)
    (clear A)
  ))
)