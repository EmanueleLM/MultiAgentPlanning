(define (problem hanoi-5-peg3-prob)
  (:domain hanoi-5-peg3)
  (:objects
    p1 p2 p3 - peg
    d1 d2 d3 d4 d5 - disk
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ;; stages and successor chain to enforce discrete, ordered step progression
    (stage s0) (stage s1) (stage s2) (stage s3) (stage s4) (stage s5) (stage s6) (stage s7) (stage s8) (stage s9)
    (stage s10) (stage s11) (stage s12) (stage s13) (stage s14) (stage s15) (stage s16) (stage s17) (stage s18) (stage s19)
    (stage s20) (stage s21) (stage s22) (stage s23) (stage s24) (stage s25) (stage s26) (stage s27) (stage s28) (stage s29)
    (stage s30) (stage s31)

    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9)
    (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16) (next s16 s17)
    (next s17 s18) (next s18 s19) (next s19 s20) (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25)
    (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30) (next s30 s31)

    ;; initial current stage
    (current s0)

    ;; initial tower on the middle peg p2: from top to bottom d1,d2,d3,d4,d5
    (on-disk d1 d2)
    (on-disk d2 d3)
    (on-disk d3 d4)
    (on-disk d4 d5)
    (on-peg  d5 p2)

    ;; all disks located at peg p2 initially
    (located d1 p2) (located d2 p2) (located d3 p2) (located d4 p2) (located d5 p2)

    ;; top-of-peg marker: top disk on peg p2 is d1
    (top-of-peg d1 p2)

    ;; clear flags: only the top disk is clear initially
    (clear-disk d1)

    ;; empty pegs: left (p1) and right (p3) are empty initially
    (empty p1) (empty p3)

    ;; diff facts for ordered distinct peg pairs
    (diff p1 p2) (diff p1 p3) (diff p2 p1) (diff p2 p3) (diff p3 p1) (diff p3 p2)

    ;; static size ordering (d1 smallest ... d5 largest)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5)
    (smaller d3 d4) (smaller d3 d5)
    (smaller d4 d5)
  )

  (:goal (and
    ;; final tower must be fully on the right peg p3 with correct stacking order
    (on-disk d1 d2)
    (on-disk d2 d3)
    (on-disk d3 d4)
    (on-disk d4 d5)
    (on-peg  d5 p3)

    ;; each disk located on peg p3
    (located d1 p3) (located d2 p3) (located d3 p3) (located d4 p3) (located d5 p3)

    ;; final top-of-peg marker and emptiness constraints: left and middle pegs empty
    (top-of-peg d1 p3)
    (empty p1)
    (empty p2)
  ))