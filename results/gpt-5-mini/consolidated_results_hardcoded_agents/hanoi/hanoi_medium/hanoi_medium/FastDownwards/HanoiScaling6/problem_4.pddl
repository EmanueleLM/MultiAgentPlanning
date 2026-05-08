(define (problem hanoi-5-3-staged)
  (:domain tower-of-hanoi-staged)
  (:objects
    d1 d2 d3 d4 d5 - disk
    p1 p2 p3 - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - step
  )

  (:init
    ;; stages successor chain (s0 -> s1 -> ... -> s31)
    (succ s0 s1)  (succ s1 s2)  (succ s2 s3)  (succ s3 s4)  (succ s4 s5)
    (succ s5 s6)  (succ s6 s7)  (succ s7 s8)  (succ s8 s9)  (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25)
    (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30)
    (succ s30 s31)

    (cur s0)

    ;; static size ordering: d1 smallest ... d5 largest
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5)
    (smaller d3 d4) (smaller d3 d5)
    (smaller d4 d5)

    ;; peg distinctness (ordered pairs)
    (diff-peg p1 p2) (diff-peg p1 p3) (diff-peg p2 p1) (diff-peg p2 p3) (diff-peg p3 p1) (diff-peg p3 p2)

    ;; disk distinctness (ordered pairs)
    (diff-disk d1 d2) (diff-disk d1 d3) (diff-disk d1 d4) (diff-disk d1 d5)
    (diff-disk d2 d1) (diff-disk d2 d3) (diff-disk d2 d4) (diff-disk d2 d5)
    (diff-disk d3 d1) (diff-disk d3 d2) (diff-disk d3 d4) (diff-disk d3 d5)
    (diff-disk d4 d1) (diff-disk d4 d2) (diff-disk d4 d3) (diff-disk d4 d5)
    (diff-disk d5 d1) (diff-disk d5 d2) (diff-disk d5 d3) (diff-disk d5 d4)

    ;; initial stack on peg p1: bottom d5, then d4, d3, d2, top d1
    (on-peg d5 p1)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; top-of-stack and empty flags initially
    (clear d1)
    (empty p2)
    (empty p3)
  )

  (:goal (and
    ;; final complete stack on peg p3: bottom d5 -> top d1
    (on-peg d5 p3)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; pegs p1 and p2 must be empty in the final state
    (empty p1)
    (empty p2)

    ;; require terminal stage after 31 moves
    (cur s31)
  ))