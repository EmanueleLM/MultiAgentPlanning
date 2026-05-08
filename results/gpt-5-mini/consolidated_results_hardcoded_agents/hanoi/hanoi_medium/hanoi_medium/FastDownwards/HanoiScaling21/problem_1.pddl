(define (problem hanoi-5-problem)
  (:domain hanoi-5-domain)

  (:objects
    a b c d e - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9
    s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
    s20 s21 s22 s23 s24 s25 s26 s27 s28 s29
    s30 s31 - step
  )

  (:init
    ;; Size ordering (smallest -> largest)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    ;; Initial on-chain: top->bottom a,b,c,d,e on left peg
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e left)

    ;; Top disk
    (top a)

    ;; Peg emptiness initially
    (peg-empty middle)
    (peg-empty right)
    ;; left peg is not empty (has e directly on it), so peg-empty left is not asserted

    ;; Discrete steps and successor relation (allow up to 31 moves: s0 -> s31)
    (current-step s0)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25)
    (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30)
    (succ s30 s31)
  )

  (:goal (and
    ;; full stack on middle peg in correct order top->bottom a,b,c,d,e
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e middle)

    ;; both other pegs empty
    (peg-empty left)
    (peg-empty right)
  ))
)