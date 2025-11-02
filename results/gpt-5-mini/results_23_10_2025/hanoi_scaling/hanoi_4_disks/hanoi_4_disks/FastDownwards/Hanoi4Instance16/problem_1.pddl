(define (problem Hanoi4Instance16)
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

    ;; only the top disk is clear
    (clear-disk A)

    ;; middle and right pegs are empty initially
    (clear-peg middle)
    (clear-peg right)

    ;; size relations: A < B < C < D (transitively expanded)
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
    ;; left and middle pegs must be empty (no disks directly on them)
    (clear-peg left)
    (clear-peg middle)
  ))
)