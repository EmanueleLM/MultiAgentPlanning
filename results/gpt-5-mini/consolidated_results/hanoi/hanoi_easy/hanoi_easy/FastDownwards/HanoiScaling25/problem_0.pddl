(define (problem hanoi-4-disks)
  (:domain hanoi-with-agent)
  (:objects
    d1 d2 d3 d4 - disk
    pegA pegB pegC - peg
    mover - agent
  )
  (:init
    ; Agent is ready to perform moves
    (agent-ready mover)

    ; Initial stack on pegA: d1 on d2, d2 on d3, d3 on d4, d4 on pegA
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 pegA)

    ; Clear facts: only the top disk and empty pegs are clear initially
    (clear d1)
    (clear pegB)
    (clear pegC)

    ; Precomputed allowed placements that enforce disk-size constraints:
    ; Any disk may be placed on any peg
    (allowed d1 pegA) (allowed d1 pegB) (allowed d1 pegC)
    (allowed d2 pegA) (allowed d2 pegB) (allowed d2 pegC)
    (allowed d3 pegA) (allowed d3 pegB) (allowed d3 pegC)
    (allowed d4 pegA) (allowed d4 pegB) (allowed d4 pegC)

    ; A disk may be placed on another disk only if it is smaller than that disk.
    ; d1 is smaller than d2, d3, d4
    (allowed d1 d2) (allowed d1 d3) (allowed d1 d4)
    ; d2 is smaller than d3, d4
    (allowed d2 d3) (allowed d2 d4)
    ; d3 is smaller than d4
    (allowed d3 d4)
    ; d4 cannot be placed on any disk (no allowed d4 di entries for disks)

    ; Note: no (allowed di di) facts (cannot place a disk onto itself).
  )

  ; Goal: move the entire stack to pegC, preserving order:
  ; d1 on d2, d2 on d3, d3 on d4, d4 on pegC
  (:goal (and
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 pegC)
  ))
)