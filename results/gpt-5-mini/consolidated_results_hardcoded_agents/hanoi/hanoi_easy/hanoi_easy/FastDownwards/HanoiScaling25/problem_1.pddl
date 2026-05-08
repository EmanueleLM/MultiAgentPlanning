(define (problem hanoi-4-disks)
  (:domain hanoi)
  (:objects
    ;; Disks (d1 = smallest A, d2 = B, d3 = C, d4 = largest D)
    d1 d2 d3 d4 - disk

    ;; Pegs: left (pegL), middle (pegM), right (pegR)
    pegL pegM pegR - peg

    ;; Stages: s0 initial through s15 final (15 moves required for 4 disks)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; Initial stage marker
    (current s0)

    ;; Successor (must use immediate successors; each move advances one stage)
    (next s0 s1)  (next s1 s2)  (next s2 s3)  (next s3 s4)
    (next s4 s5)  (next s5 s6)  (next s6 s7)  (next s7 s8)
    (next s8 s9)  (next s9 s10) (next s10 s11)(next s11 s12)
    (next s12 s13)(next s13 s14)(next s14 s15)

    ;; Initial stack on pegL (left): top-to-bottom d1, d2, d3, d4
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 pegL)

    ;; Clear facts: top disk and empty pegs are clear initially
    (clear d1)
    (clear pegM)
    (clear pegR)

    ;; Precomputed allowed placements enforcing size ordering:
    ;; Any disk may be placed on any peg
    (allowed d1 pegL) (allowed d1 pegM) (allowed d1 pegR)
    (allowed d2 pegL) (allowed d2 pegM) (allowed d2 pegR)
    (allowed d3 pegL) (allowed d3 pegM) (allowed d3 pegR)
    (allowed d4 pegL) (allowed d4 pegM) (allowed d4 pegR)

    ;; Disk-on-disk allowed only if placing a smaller disk onto a larger disk:
    ;; d1 (smallest) can be placed on d2, d3, d4
    (allowed d1 d2) (allowed d1 d3) (allowed d1 d4)
    ;; d2 can be placed on d3, d4
    (allowed d2 d3) (allowed d2 d4)
    ;; d3 can be placed on d4
    (allowed d3 d4)
    ;; d4 (largest) cannot be placed on any disk (no allowed d4 di entries)
  )

  ;; Goal: after exactly 15 moves (current s15), entire stack must be on pegM (middle)
  ;; preserving order top-to-bottom d1,d2,d3,d4, and no other goal bookkeeping is required.
  (:goal (and
    (current s15)
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 pegM)
  ))
)