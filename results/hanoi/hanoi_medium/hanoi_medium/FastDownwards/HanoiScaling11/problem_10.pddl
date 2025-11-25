(define (problem hanoi-5-peg3-prob)
  (:domain hanoi-5-peg3)
  (:objects
    left middle right - peg
    a b c d e - disk
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

    ;; initial tower on the middle peg: from top to bottom a,b,c,d,e
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e middle)

    ;; all disks located at middle initially
    (located a middle) (located b middle) (located c middle) (located d middle) (located e middle)

    ;; top-of-peg marker: top disk on middle is a
    (top-of-peg a middle)

    ;; clear flags: only the top disk is clear initially
    (clear-disk a)

    ;; empty pegs: left and right are empty initially
    (empty left) (empty right)

    ;; diff facts for ordered distinct peg pairs
    (diff left middle) (diff left right) (diff middle left) (diff middle right) (diff right left) (diff right middle)

    ;; static size ordering (a smallest ... e largest)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)
  )

  (:goal (and
    ;; final tower must be fully on the right peg with correct stacking order
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e right)

    ;; each disk located on peg right
    (located a right) (located b right) (located c right) (located d right) (located e right)

    ;; final top-of-peg marker and emptiness constraints: left and middle pegs empty
    (top-of-peg a right)
    (empty left)
    (empty middle)

    ;; final stage: require completion at end of successor chain (ensures exactly 31 moves)
    (current s31)
  ))
)