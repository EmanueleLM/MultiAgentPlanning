(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    A B C D E F - disk
    left middle right - peg
    ;; discrete steps: s0 .. s63 (63 moves required for 6 disks)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15
    s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31
    s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45 s46 s47
    s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59 s60 s61 s62 s63 - step
  )

  (:init
    ;; Initial stack on right peg (bottom F ... top A)
    (on F right)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; Clear predicates: only the top disk A and the empty pegs (left,middle) are clear initially.
    (clear A)
    (clear left)
    (clear middle)

    ;; Size relations (static): F largest ... A smallest.
    (larger F E) (larger F D) (larger F C) (larger F B) (larger F A)
    (larger E D) (larger E C) (larger E B) (larger E A)
    (larger D C) (larger D B) (larger D A)
    (larger C B) (larger C A)
    (larger B A)

    ;; Stage ordering: a contiguous chain from s0 to s63 (each move advances exactly one stage)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8)
    (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20) (succ s20 s21) (succ s21 s22)
    (succ s22 s23) (succ s23 s24) (succ s24 s25) (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29)
    (succ s29 s30) (succ s30 s31) (succ s31 s32) (succ s32 s33) (succ s33 s34) (succ s34 s35) (succ s35 s36)
    (succ s36 s37) (succ s37 s38) (succ s38 s39) (succ s39 s40) (succ s40 s41) (succ s41 s42) (succ s42 s43)
    (succ s43 s44) (succ s44 s45) (succ s45 s46) (succ s46 s47) (succ s47 s48) (succ s48 s49) (succ s49 s50)
    (succ s50 s51) (succ s51 s52) (succ s52 s53) (succ s53 s54) (succ s54 s55) (succ s55 s56) (succ s56 s57)
    (succ s57 s58) (succ s58 s59) (succ s59 s60) (succ s60 s61) (succ s61 s62) (succ s62 s63)

    ;; start at step s0
    (cur-step s0)
  )

  (:goal (and
    ;; final stack on left (bottom F ... top A)
    (on F left)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)

    ;; final clear facts: top disk A is clear; middle and right pegs empty
    (clear A)
    (clear middle)
    (clear right)

    ;; require that execution has progressed to the final contiguous stage
    (cur-step s63)
  ))
)