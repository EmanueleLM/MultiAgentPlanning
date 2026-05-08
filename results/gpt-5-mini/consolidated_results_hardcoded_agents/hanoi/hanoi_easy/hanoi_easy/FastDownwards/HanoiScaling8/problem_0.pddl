(define (problem hanoi-4)
  (:domain hanoi-domain)
  (:objects
    A B C D - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left peg: D bottom, then C, then B, then A top
    (on D left)
    (on C D)
    (on B C)
    (on A B)

    ;; clear facts: only the top disk and empty pegs are clear
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering: A < B < C < D (transitively fully specified)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )

  ;; Goal: entire tower moved to right peg with same order (D bottom ... A top)
  (:goal (and
    (on D right)
    (on C D)
    (on B C)
    (on A B)
  ))
)