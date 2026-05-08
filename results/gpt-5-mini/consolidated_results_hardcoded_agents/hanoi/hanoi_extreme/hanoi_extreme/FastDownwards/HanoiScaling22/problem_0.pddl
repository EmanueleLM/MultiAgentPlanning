; Problem: Classic 3-disk Tower of Hanoi instance (single-agent)
; Public information and enforced constraints:
; - Three pegs: pA (source), pB (auxiliary), pC (target).
; - Three disks: d1 (smallest), d2 (medium), d3 (largest).
; - Size ordering is encoded as static (smaller ...) facts and enforced as a hard constraint.
; - Only legal moves are allowed: move the top disk from one peg to another, and never place a larger disk onto a smaller one.
; - The initial and goal stack configurations are specified explicitly so the solver cannot reorder stack constraints.
(define (problem hanoi-3)
  (:domain hanoi)
  (:objects
    pA pB pC - peg
    d1 d2 d3 - disk
  )

  (:init
    ; initial direct-support relations (stack on pA: d1 on d2, d2 on d3, d3 on pA)
    (on d1 d2)
    (on d2 d3)
    (on d3 pA)

    ; top-of-peg facts: d1 is top of pA; pB and pC are empty
    (top d1 pA)
    (empty pB)
    (empty pC)

    ; size order (static): d1 < d2 < d3
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d2 d3)
  )

  ; Goal: all disks stacked on peg pC in the same order (d1 on d2, d2 on d3, d3 on pC),
  ; with pA and pB empty and top of pC being d1. These are explicit terminal conditions.
  (:goal (and
    (on d1 d2)
    (on d2 d3)
    (on d3 pC)

    (top d1 pC)

    (empty pA)
    (empty pB)
  ))
)