(define (problem hanoi4-problem)
  (:domain hanoi4)

  (:objects
    A B C D - disk
    left middle right - peg
  )

  ;; Minimal initial state encoding:
  ;; - Right peg holds stack top->bottom: A, B, C, D
  ;; - Left and middle pegs are empty
  ;; - Size relations: A < B < C < D (pairwise facts sufficient for move checks)
  (:init
    ;; stack: A on B, B on C, C on D, D on right peg; A is top of right peg
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D right)
    (top A right)

    ;; empty pegs
    (empty left)
    (empty middle)

    ;; size relations (only the needed pairwise comparisons)
    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)
  )

  ;; Goal: left peg must hold full stack top-to-bottom A,B,C,D and middle/right empty.
  (:goal (and
    (top A left)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D left)

    (empty middle)
    (empty right)
  ))
)