(define (problem hanoi-4-disks)
  (:domain hanoi)
  (:objects
    ;; disks (d1 = smallest A, d2 = B, d3 = C, d4 = largest D)
    d1 d2 d3 d4 - obj

    ;; pegs (left, middle, right)
    pegl pegm pegr - obj

    ;; discrete stages: s0 .. s15 (15 moves required for 4 disks)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; classification
    (disk d1) (disk d2) (disk d3) (disk d4)
    (peg pegl) (peg pegm) (peg pegr)

    ;; initial stage marker
    (current s0)

    ;; immediate successor chain: each move advances exactly one stage
    (next s0 s1)  (next s1 s2)  (next s2 s3)  (next s3 s4)
    (next s4 s5)  (next s5 s6)  (next s6 s7)  (next s7 s8)
    (next s8 s9)  (next s9 s10) (next s10 s11)(next s11 s12)
    (next s12 s13)(next s13 s14)(next s14 s15)

    ;; initial stacking on pegl (left) top-to-bottom: d1,d2,d3,d4
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 pegl)

    ;; clear facts initially: only top disk and empty pegs are clear
    (clear d1)
    (clear pegm)
    (clear pegr)

    ;; allowed placements enforce size ordering (smaller onto larger or onto pegs)
    ;; allowed onto pegs
    (allowed d1 pegl) (allowed d1 pegm) (allowed d1 pegr)
    (allowed d2 pegl) (allowed d2 pegm) (allowed d2 pegr)
    (allowed d3 pegl) (allowed d3 pegm) (allowed d3 pegr)
    (allowed d4 pegl) (allowed d4 pegm) (allowed d4 pegr)

    ;; allowed disk-on-disk only when smaller onto larger
    ;; d1 (smallest) onto d2,d3,d4
    (allowed d1 d2) (allowed d1 d3) (allowed d1 d4)
    ;; d2 onto d3,d4
    (allowed d2 d3) (allowed d2 d4)
    ;; d3 onto d4
    (allowed d3 d4)
    ;; d4 (largest) not allowed onto any disk (no allowed d4 di entries)
  )

  ;; Goal: after exactly 15 moves (current s15), full stack on pegm (middle)
  ;; top-to-bottom: d1,d2,d3,d4. Also require left and right pegs to be empty (clear).
  (:goal (and
    (current s15)
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 pegm)
    (clear pegl)
    (clear pegr)
  ))
)