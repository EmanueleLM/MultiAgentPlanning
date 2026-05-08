(define (problem hanoi-4-disks)
  (:domain hanoi)
  (:objects
    d1 d2 d3 d4 - disk
    pegl pegm pegr - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 pegl)

    (clear d1)
    (clear pegm)
    (clear pegr)

    (current s0)

    (next s0 s1)  (next s1 s2)  (next s2 s3)  (next s3 s4)
    (next s4 s5)  (next s5 s6)  (next s6 s7)  (next s7 s8)
    (next s8 s9)  (next s9 s10) (next s10 s11)(next s11 s12)
    (next s12 s13)(next s13 s14)(next s14 s15)

    ;; allowed: any disk onto any peg
    (allowed d1 pegl) (allowed d1 pegm) (allowed d1 pegr)
    (allowed d2 pegl) (allowed d2 pegm) (allowed d2 pegr)
    (allowed d3 pegl) (allowed d3 pegm) (allowed d3 pegr)
    (allowed d4 pegl) (allowed d4 pegm) (allowed d4 pegr)

    ;; allowed smaller onto larger (disk onto disk)
    (allowed d1 d2) (allowed d1 d3) (allowed d1 d4)
    (allowed d2 d3) (allowed d2 d4)
    (allowed d3 d4)
  )

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