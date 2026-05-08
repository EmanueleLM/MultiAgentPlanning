(define (problem hanoi-4-disks)
  (:domain hanoi)
  (:objects
    a b c d - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; initial stack on left peg: top a, then b, then c, then d
    (on a b)
    (on b c)
    (on c d)
    (on d left)

    ;; clear supports initially: top disk a and the two empty pegs
    (clear a)
    (clear middle)
    (clear right)

    ;; stage/time progression and initial current stage
    (current s0)
    (next s0 s1)  (next s1 s2)  (next s2 s3)  (next s3 s4)
    (next s4 s5)  (next s5 s6)  (next s6 s7)  (next s7 s8)
    (next s8 s9)  (next s9 s10) (next s10 s11)(next s11 s12)
    (next s12 s13)(next s13 s14)(next s14 s15)

    ;; disk size ordering: a < b < c < d
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)
  )

  (:goal (and
    ;; require final stage
    (current s15)

    ;; goal stack on middle peg: top a, then b, then c, then d
    (on a b)
    (on b c)
    (on c d)
    (on d middle)

    ;; left and right pegs empty
    (clear left)
    (clear right)
  ))