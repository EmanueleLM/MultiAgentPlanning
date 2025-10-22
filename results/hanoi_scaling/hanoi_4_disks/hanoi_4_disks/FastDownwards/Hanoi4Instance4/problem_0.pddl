(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    A B C D - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left: top-to-bottom A, B, C, D
    (on A B)
    (on B C)
    (on C D)
    (on D left)

    ;; clear predicates: top disks and empty pegs
    (clear A)
    (clear middle)
    (clear right)

    ;; size ordering (static)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )
  (:goal (and
    ;; goal stack on right: top-to-bottom A, B, C, D
    (on A B)
    (on B C)
    (on C D)
    (on D right)
  ))
)