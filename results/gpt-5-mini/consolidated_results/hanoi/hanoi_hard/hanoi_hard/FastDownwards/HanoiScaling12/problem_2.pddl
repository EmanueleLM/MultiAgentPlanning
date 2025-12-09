(define (problem hanoi-6-staged)
  (:domain tower-of-hanoi-staged)

  (:objects
    A B C D E F - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
    s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39
    s40 s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59
    s60 s61 s62 s63 - stage
  )

  (:init
    ;; type markers
    (disk A) (disk B) (disk C) (disk D) (disk E) (disk F)
    (peg left) (peg middle) (peg right)
    (stage s0) (stage s1) (stage s2) (stage s3) (stage s4) (stage s5) (stage s6) (stage s7) (stage s8) (stage s9)
    (stage s10) (stage s11) (stage s12) (stage s13) (stage s14) (stage s15) (stage s16) (stage s17) (stage s18) (stage s19)
    (stage s20) (stage s21) (stage s22) (stage s23) (stage s24) (stage s25) (stage s26) (stage s27) (stage s28) (stage s29)
    (stage s30) (stage s31) (stage s32) (stage s33) (stage s34) (stage s35) (stage s36) (stage s37) (stage s38) (stage s39)
    (stage s40) (stage s41) (stage s42) (stage s43) (stage s44) (stage s45) (stage s46) (stage s47) (stage s48) (stage s49)
    (stage s50) (stage s51) (stage s52) (stage s53) (stage s54) (stage s55) (stage s56) (stage s57) (stage s58) (stage s59)
    (stage s60) (stage s61) (stage s62) (stage s63)

    ;; stage succession (enforce contiguous progression)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
    (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20)
    (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25) (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30)
    (next s30 s31) (next s31 s32) (next s32 s33) (next s33 s34) (next s34 s35) (next s35 s36) (next s36 s37) (next s37 s38) (next s38 s39) (next s39 s40)
    (next s40 s41) (next s41 s42) (next s42 s43) (next s43 s44) (next s44 s45) (next s45 s46) (next s46 s47) (next s47 s48) (next s48 s49) (next s49 s50)
    (next s50 s51) (next s51 s52) (next s52 s53) (next s53 s54) (next s54 s55) (next s55 s56) (next s56 s57) (next s57 s58) (next s58 s59) (next s59 s60)
    (next s60 s61) (next s61 s62) (next s62 s63)

    ;; initial current stage
    (at-stage s0)

    ;; initial stack on right peg (top A, bottom F)
    (on F right)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; top-of-object facts for initial configuration
    (clear A)        ;; A is top-most disk
    (clear left)     ;; left peg empty
    (clear middle)   ;; middle peg empty

    ;; size ordering: A smallest, F largest
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)
  )

  (:goal (and
    ;; final stack entirely on left in correct order (F bottom -> A top)
    (on F left)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; middle and right pegs empty
    (clear middle)
    (clear right)

    ;; top disk A must be top
    (clear A)

    ;; must have advanced to final stage after exactly 63 moves
    (at-stage s63)
  ))