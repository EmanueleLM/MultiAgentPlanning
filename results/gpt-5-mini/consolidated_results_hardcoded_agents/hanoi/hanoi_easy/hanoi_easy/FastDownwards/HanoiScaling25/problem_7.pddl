(define (problem hanoi-4-disks)
  (:domain hanoi)
  (:objects
    d1 d2 d3 d4 - disk
    pegl pegm pegr - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; initial stack on left peg: top d1, then d2, then d3, then d4 on peg pegl
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 pegl)

    ;; clear supports: only the current tops are clear (top disk and empty pegs)
    (clear d1)
    (clear pegm)
    (clear pegr)

    ;; explicit stage/time progression and initial current stage
    (current s0)
    (next s0 s1)  (next s1 s2)  (next s2 s3)  (next s3 s4)
    (next s4 s5)  (next s5 s6)  (next s6 s7)  (next s7 s8)
    (next s8 s9)  (next s9 s10) (next s10 s11)(next s11 s12)
    (next s12 s13)(next s13 s14)(next s14 s15)

    ;; disk size ordering (A < B < C < D corresponds to d1 < d2 < d3 < d4)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4)
    (smaller d2 d3) (smaller d2 d4)
    (smaller d3 d4)
  )

  (:goal (and
    ;; require final stage
    (current s15)

    ;; goal stack on middle peg pegm: top d1, then d2, then d3, then d4 on pegm
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 pegm)

    ;; left and right pegs must be empty
    (clear pegl)
    (clear pegr)
  ))
)