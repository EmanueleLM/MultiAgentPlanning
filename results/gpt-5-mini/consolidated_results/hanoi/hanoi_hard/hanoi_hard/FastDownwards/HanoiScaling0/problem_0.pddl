(define (problem hanoi6-problem)
  (:domain hanoi6)

  (:objects
    A B C D E F - disk
    left middle right - peg
    left_base middle_base right_base - base
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10
    s11 s12 s13 s14 s15 s16 s17 s18 s19 s20
    s21 s22 s23 s24 s25 s26 s27 s28 s29 s30
    s31 s32 s33 s34 s35 s36 s37 s38 s39 s40
    s41 s42 s43 s44 s45 s46 s47 s48 s49 s50
    s51 s52 s53 s54 s55 s56 s57 s58 s59 s60
    s61 s62 s63 s64 - step
  )

  (:init
    ;; peg bases
    (peg-base left left_base)
    (peg-base middle middle_base)
    (peg-base right right_base)

    ;; initial support structure (middle peg from bottom to top: F E D C B A)
    (on-base F middle_base)
    (on-disk E F)
    (on-disk D E)
    (on-disk C D)
    (on-disk B C)
    (on-disk A B)

    ;; all disks start on the middle peg
    (at A middle) (at B middle) (at C middle)
    (at D middle) (at E middle) (at F middle)

    ;; clear/top markers: A is top of its peg initially; bases left and right are clear (empty pegs)
    (clear-disk A)
    (clear-base left_base)
    (clear-base right_base)
    ;; middle_base is not clear (F is on it) -- omitted as false by closed-world semantics

    ;; size ordering facts (smallest to largest A < B < C < D < E < F)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F)
    (smaller C D) (smaller C E) (smaller C F)
    (smaller D E) (smaller D F)
    (smaller E F)

    ;; step successor chain
    (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6)
    (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10) (succ s10 s11)
    (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15) (succ s15 s16)
    (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20) (succ s20 s21)
    (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25) (succ s25 s26)
    (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30) (succ s30 s31)
    (succ s31 s32) (succ s32 s33) (succ s33 s34) (succ s34 s35) (succ s35 s36)
    (succ s36 s37) (succ s37 s38) (succ s38 s39) (succ s39 s40) (succ s40 s41)
    (succ s41 s42) (succ s42 s43) (succ s43 s44) (succ s44 s45) (succ s45 s46)
    (succ s46 s47) (succ s47 s48) (succ s48 s49) (succ s49 s50) (succ s50 s51)
    (succ s51 s52) (succ s52 s53) (succ s53 s54) (succ s54 s55) (succ s55 s56)
    (succ s56 s57) (succ s57 s58) (succ s58 s59) (succ s59 s60) (succ s60 s61)
    (succ s61 s62) (succ s62 s63) (succ s63 s64)

    ;; the plan must start at step s1
    (current s1)

    ;; Allowed moves per step (the corrected, audited 63-step sequence).
    ;; Step format: (allowed-move sN <disk> <from-peg> <to-peg>)
    (allowed-move s1 A middle left)
    (allowed-move s2 B middle right)
    (allowed-move s3 A left right)
    (allowed-move s4 C middle left)
    (allowed-move s5 A right middle)
    (allowed-move s6 B right left)
    (allowed-move s7 A middle left)
    (allowed-move s8 D middle right)
    (allowed-move s9 A left right)
    (allowed-move s10 B left middle)
    (allowed-move s11 A right middle)
    (allowed-move s12 C left right)
    (allowed-move s13 A middle left)
    (allowed-move s14 B middle right)
    (allowed-move s15 A left right)
    (allowed-move s16 E middle left)
    (allowed-move s17 A right middle)
    (allowed-move s18 B right left)
    (allowed-move s19 A middle left)
    (allowed-move s20 C right middle)
    (allowed-move s21 A left right)
    (allowed-move s22 B left middle)
    (allowed-move s23 A right middle)
    (allowed-move s24 D right left)
    (allowed-move s25 A middle left)
    (allowed-move s26 B middle right)
    (allowed-move s27 A left right)
    (allowed-move s28 C middle left)
    (allowed-move s29 A right middle)
    (allowed-move s30 B right left)
    (allowed-move s31 A middle left)
    (allowed-move s32 F middle right)
    (allowed-move s33 A left right)
    (allowed-move s34 B left middle)
    (allowed-move s35 A right middle)
    (allowed-move s36 C left right)
    (allowed-move s37 A middle left)
    (allowed-move s38 B middle right)
    (allowed-move s39 A left right)
    (allowed-move s40 D left middle)
    (allowed-move s41 A right middle)
    (allowed-move s42 B right left)
    (allowed-move s43 A middle left)
    (allowed-move s44 C right middle)
    (allowed-move s45 A left right)
    (allowed-move s46 B left middle)
    (allowed-move s47 A right middle)
    (allowed-move s48 E left right)
    (allowed-move s49 A middle left)
    (allowed-move s50 B middle right)
    (allowed-move s51 A left right)
    (allowed-move s52 C middle left)
    (allowed-move s53 A right middle)
    (allowed-move s54 B right left)
    (allowed-move s55 A middle left)
    (allowed-move s56 D middle right)
    (allowed-move s57 A left right)
    (allowed-move s58 B left middle)
    (allowed-move s59 A right middle)
    (allowed-move s60 C left right)
    (allowed-move s61 A middle left)
    (allowed-move s62 B middle right)
    (allowed-move s63 A left right)
  )

  (:goal (and
    ;; all disks must be on the right peg
    (at A right) (at B right) (at C right) (at D right) (at E right) (at F right)

    ;; stack order on right (from bottom to top): F (on base), E on F, D on E, C on D, B on C, A on B
    (on-base F right_base)
    (on-disk E F) (on-disk D E) (on-disk C D) (on-disk B C) (on-disk A B)

    ;; right peg top is A
    (clear-disk A)

    ;; left and middle pegs must be empty (their bases clear)
    (clear-base left_base)
    (clear-base middle_base)

    ;; ensure the full 63-step sequence was advanced (we require current s64)
    (current s64)
  ))
)