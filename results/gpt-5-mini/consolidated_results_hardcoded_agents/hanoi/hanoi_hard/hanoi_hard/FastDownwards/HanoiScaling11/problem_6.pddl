(define (problem hanoi-6-instance)
  (:domain hanoi-6)
  (:objects
    A B C D E F - disk
    L M R - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15
    s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31
    s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45 s46 s47
    s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59 s60 s61 s62 s63 - step
  )

  (:init
    ;; initial full stack on middle peg M: from top A on B on C on D on E on F (F is the bottom on peg M)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-peg F M)
    (top M A)

    ;; other pegs empty
    (empty L)
    (empty R)

    ;; size ordering: smaller x y means x is smaller than y (total order A < B < C < D < E < F)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)

    ;; explicit temporal stages: allow up to 63 moves (2^6 - 1)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20) (succ s20 s21) (succ s21 s22) (succ s22 s23)
    (succ s23 s24) (succ s24 s25) (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30) (succ s30 s31)
    (succ s31 s32) (succ s32 s33) (succ s33 s34) (succ s34 s35) (succ s35 s36) (succ s36 s37) (succ s37 s38) (succ s38 s39)
    (succ s39 s40) (succ s40 s41) (succ s41 s42) (succ s42 s43) (succ s43 s44) (succ s44 s45) (succ s45 s46) (succ s46 s47)
    (succ s47 s48) (succ s48 s49) (succ s49 s50) (succ s50 s51) (succ s51 s52) (succ s52 s53) (succ s53 s54) (succ s54 s55)
    (succ s55 s56) (succ s56 s57) (succ s57 s58) (succ s58 s59) (succ s59 s60) (succ s60 s61) (succ s61 s62) (succ s62 s63)

    ;; start at stage s0
    (current s0)
  )

  (:goal (and
    ;; goal stack on right peg R: from top A on B on C on D on E on F (F on peg R)
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-disk D E)
    (on-disk E F)
    (on-peg F R)
    (top R A)
    ;; other pegs empty
    (empty L)
    (empty M)
  ))
)