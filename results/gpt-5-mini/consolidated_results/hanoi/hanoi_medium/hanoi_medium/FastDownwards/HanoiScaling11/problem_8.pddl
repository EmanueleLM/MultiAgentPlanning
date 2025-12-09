(define (problem hanoi-5-peg3-prob)
  (:domain hanoi-5-peg3)
  (:objects
    left middle right - peg
    A B C D E - disk
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ;; successor chain for stages (exactly 31 moves from s0 to s31)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9)
    (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16) (next s16 s17)
    (next s17 s18) (next s18 s19) (next s19 s20) (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25)
    (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30) (next s30 s31)

    ;; initial current stage
    (current s0)

    ;; initial tower on the middle peg: from top to bottom A,B,C,D,E
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-peg  E middle)

    ;; all disks located at middle initially
    (located A middle) (located B middle) (located C middle) (located D middle) (located E middle)

    ;; top-of-peg marker: top disk on middle is A
    (top-of-peg A middle)

    ;; clear flags: only the top disk is clear initially
    (clear-disk A)

    ;; empty pegs: left and right are empty initially
    (empty left) (empty right)

    ;; diff facts for ordered distinct peg pairs
    (diff left middle) (diff left right) (diff middle left) (diff middle right) (diff right left) (diff right middle)

    ;; static size ordering (A smallest ... E largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)
  )

  (:goal (and
    ;; final tower must be fully on the right peg with correct stacking order
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-peg  E right)

    ;; each disk located on peg right
    (located A right) (located B right) (located C right) (located D right) (located E right)

    ;; final top-of-peg marker and emptiness constraints: left and middle pegs empty
    (top-of-peg A right)
    (empty left)
    (empty middle)

    ;; final stage: require completion at end of successor chain (ensures exactly 31 moves)
    (current s31)
  ))
)