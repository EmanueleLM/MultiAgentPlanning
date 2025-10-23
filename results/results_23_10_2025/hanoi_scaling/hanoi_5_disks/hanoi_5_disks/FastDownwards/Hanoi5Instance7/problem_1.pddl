(define (problem hanoi-5-left-to-right)
  (:domain hanoi)
  (:objects
    A B C D E - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left: A on B, B on C, C on D, D on E, E on peg left
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-peg E left)

    ;; only the top disk A is clear; middle and right pegs are empty (clear)
    (clear-disk A)
    (clear-peg middle)
    (clear-peg right)

    ;; size ordering (A smallest, E largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal (and
    ;; goal: all disks moved to right peg in same stacking order
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-peg E right)
  ))
)