(define (problem hanoi4instance13-problem)
  (:domain hanoi4instance13)

  (:objects
    a b c d - disk
    left middle right - peg
    left_controller middle_controller right_controller orchestrator - agent
  )

  (:init
    ;; initial stacking on the left peg: top A on B, B on C, C on D, D on left peg
    (on-peg d left)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)

    ;; top/clear indicators: only A is top initially
    (clear-disk a)
    ;; b, c, d are not clear (omitted)

    ;; peg occupancy: left has disks (so not listed as clear), middle and right are empty
    (clear-peg middle)
    (clear-peg right)

    ;; support: all disks initially supported by left peg
    (support a left)
    (support b left)
    (support c left)
    (support d left)

    ;; agents control respective pegs
    (controls left_controller left)
    (controls middle_controller middle)
    (controls right_controller right)
    ;; orchestrator has no control over pegs (no controls fact for it)

    ;; size ordering (A smallest, D largest)
    (smaller a b)
    (smaller a c)
    (smaller a d)
    (smaller b c)
    (smaller b d)
    (smaller c d)
  )

  (:goal (and
    ;; all disks on right peg in correct order (D bottom -> C -> B -> A top)
    (on-peg d right)
    (on-disk c d)
    (on-disk b c)
    (on-disk a b)
  ))
)