(define (problem hanoi6-problem)
  (:domain hanoi6)
  (:objects
    d1 d2 d3 d4 d5 d6 - disk
    p1 p2 p3 - peg
    ;; stages: s0 initial, s63 terminal (exactly 63 moves required for optimal solution)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9
    s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
    s20 s21 s22 s23 s24 s25 s26 s27 s28 s29
    s30 s31 s32 s33 s34 s35 s36 s37 s38 s39
    s40 s41 s42 s43 s44 s45 s46 s47 s48 s49
    s50 s51 s52 s53 s54 s55 s56 s57 s58 s59
    s60 s61 s62 s63 - stage
  )

  (:init
    ;; size ordering: d1 smallest, d6 largest (explicit pairwise ordering)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)

    ;; initial stacking on peg p1 (bottom d6, then d5, ..., top d1)
    (on-peg d6 p1)
    (on-disk d5 d6)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)

    ;; top and empties
    (top p1 d1)
    (top-empty p2)
    (top-empty p3)

    ;; stage successor chain (explicit ordered stages)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
    (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25)
    (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)
    (next s30 s31) (next s31 s32) (next s32 s33) (next s33 s34) (next s34 s35)
    (next s35 s36) (next s36 s37) (next s37 s38) (next s38 s39) (next s39 s40)
    (next s40 s41) (next s41 s42) (next s42 s43) (next s43 s44) (next s44 s45)
    (next s45 s46) (next s46 s47) (next s47 s48) (next s48 s49) (next s49 s50)
    (next s50 s51) (next s51 s52) (next s52 s53) (next s53 s54) (next s54 s55)
    (next s55 s56) (next s56 s57) (next s57 s58) (next s58 s59) (next s59 s60)
    (next s60 s61) (next s61 s62) (next s62 s63)

    ;; initial global stage
    (at-stage s0)
  )

  (:goal (and
    ;; all disks must be stacked on peg p3 in the same order (d6 bottom ... d1 top)
    (on-peg d6 p3)
    (on-disk d5 d6)
    (on-disk d4 d5)
    (on-disk d3 d4)
    (on-disk d2 d3)
    (on-disk d1 d2)
    (top p3 d1)

    ;; explicit emptiness of other pegs required
    (top-empty p1)
    (top-empty p2)

    ;; final stage must be reached (ensures plan uses contiguous stage progression)
    (at-stage s63)
  )))