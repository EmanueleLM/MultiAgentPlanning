(define (problem hanoi6-prob)
  (:domain hanoi6)
  (:objects
    left middle right - peg
    A B C D E F - disk
    ;; stages s0 .. s63 allowing up to 63 moves (2^6 - 1 = 63). Start at s0; goal requires reaching s63.
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15
    s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31
    s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45 s46 s47
    s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59 s60 s61 s62 s63 - stage
  )

  (:init
    ;; Size ordering (A smallest ... F largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)

    ;; Initial stack on left: top-to-bottom A,B,C,D,E,F (A on B, B on C, ..., F on left)
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F left)

    ;; Peg top/empty bookkeeping
    (top left A)
    (empty middle)
    (empty right)

    ;; Clear predicates: only the top disk A is clear initially (nothing on A)
    (clear A)

    ;; Stage chain (static)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15)
    (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20) (next s20 s21) (next s21 s22)
    (next s22 s23) (next s23 s24) (next s24 s25) (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29)
    (next s29 s30) (next s30 s31) (next s31 s32) (next s32 s33) (next s33 s34) (next s34 s35) (next s35 s36)
    (next s36 s37) (next s37 s38) (next s38 s39) (next s39 s40) (next s40 s41) (next s41 s42) (next s42 s43)
    (next s43 s44) (next s44 s45) (next s45 s46) (next s46 s47) (next s47 s48) (next s48 s49) (next s49 s50)
    (next s50 s51) (next s51 s52) (next s52 s53) (next s53 s54) (next s54 s55) (next s55 s56) (next s56 s57)
    (next s57 s58) (next s58 s59) (next s59 s60) (next s60 s61) (next s61 s62) (next s62 s63)

    ;; Initial current stage
    (current s0)
  )

  (:goal
    (and
      ;; desired on-chains on middle peg: top-to-bottom A,B,C,D,E,F (A on B, ..., F on middle)
      (on A B)
      (on B C)
      (on C D)
      (on D E)
      (on E F)
      (on F middle)

      ;; top of middle is A
      (top middle A)

      ;; left and right must be empty
      (empty left)
      (empty right)

      ;; require that we have advanced through the stage sequence to the final stage s63
      (current s63)
    )
  )
)