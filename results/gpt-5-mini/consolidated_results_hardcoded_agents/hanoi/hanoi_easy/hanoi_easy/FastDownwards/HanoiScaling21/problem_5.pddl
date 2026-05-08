(define (problem hanoi-4-to-mid-with-stages)
  (:domain hanoi-stages)
  (:objects
    a b c d - disk
    left mid right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 - stage
  )

  (:init
    ;; disk size ordering (smallest -> largest)
    (smaller a b)
    (smaller a c)
    (smaller a d)
    (smaller b c)
    (smaller b d)
    (smaller c d)

    ;; initial stack on left peg: top->bottom a b c d
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg d left)

    ;; top and emptiness facts
    (top left a)
    (empty mid)
    (empty right)

    ;; stages and successors to enforce contiguous single-step progression
    (stage s0) (stage s1) (stage s2) (stage s3) (stage s4)
    (stage s5) (stage s6) (stage s7) (stage s8) (stage s9)
    (stage s10) (stage s11) (stage s12) (stage s13) (stage s14) (stage s15)

    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4)
    (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12)
    (next s12 s13) (next s13 s14) (next s14 s15)

    ;; starting stage
    (current s0)
  )

  (:goal (and
    ;; final stage reached
    (current s15)

    ;; entire stack replicated on mid peg top->bottom a b c d
    (top mid a)
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-peg d mid)

    ;; other pegs empty
    (empty left)
    (empty right)
  ))
)