(define (problem hanoi-4)
  (:domain hanoi)
  (:objects
    left middle right - peg
    A B C D - disk
  )
  (:init
    ;; initial stack on left: top->bottom A, B, C, D
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D left)

    ;; clear predicates: top disks / empty pegs
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; size relations: A < B < C < D
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )
  (:goal (and
    ;; final stack on right: top->bottom A, B, C, D
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D right)
    ;; left and middle pegs must be empty
    (clear-peg left)
    (clear-peg middle)
  ))
)