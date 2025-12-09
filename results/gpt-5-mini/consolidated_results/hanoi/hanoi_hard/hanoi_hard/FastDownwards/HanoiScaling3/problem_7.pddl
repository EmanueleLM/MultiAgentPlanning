(define (problem hanoi-3peg-6disk)
  (:domain hanoi-multiagent)

  (:objects
    d1 d2 d3 d4 d5 d6 - disk
    pega pegb pegc - peg
    player - agent
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59 s60 s61 s62 s63 s64 - step
  )

  (:init
    ;; actor
    (hanoi-player player)

    ;; initial stack on left peg (top to bottom: d1,d2,d3,d4,d5,d6)
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 pega)

    ;; only the top disk and the empty pegs are clear initially
    (clear d1)
    (clear pegb)
    (clear pegc)

    ;; disk size ordering (d1 smallest ... d6 largest)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)

    ;; explicit discrete step ordering (contiguous progression)
    (step-successor s1 s2)   (step-successor s2 s3)   (step-successor s3 s4)
    (step-successor s4 s5)   (step-successor s5 s6)   (step-successor s6 s7)
    (step-successor s7 s8)   (step-successor s8 s9)   (step-successor s9 s10)
    (step-successor s10 s11) (step-successor s11 s12) (step-successor s12 s13)
    (step-successor s13 s14) (step-successor s14 s15) (step-successor s15 s16)
    (step-successor s16 s17) (step-successor s17 s18) (step-successor s18 s19)
    (step-successor s19 s20) (step-successor s20 s21) (step-successor s21 s22)
    (step-successor s22 s23) (step-successor s23 s24) (step-successor s24 s25)
    (step-successor s25 s26) (step-successor s26 s27) (step-successor s27 s28)
    (step-successor s28 s29) (step-successor s29 s30) (step-successor s30 s31)
    (step-successor s31 s32) (step-successor s32 s33) (step-successor s33 s34)
    (step-successor s34 s35) (step-successor s35 s36) (step-successor s36 s37)
    (step-successor s37 s38) (step-successor s38 s39) (step-successor s39 s40)
    (step-successor s40 s41) (step-successor s41 s42) (step-successor s42 s43)
    (step-successor s43 s44) (step-successor s44 s45) (step-successor s45 s46)
    (step-successor s46 s47) (step-successor s47 s48) (step-successor s48 s49)
    (step-successor s49 s50) (step-successor s50 s51) (step-successor s51 s52)
    (step-successor s52 s53) (step-successor s53 s54) (step-successor s54 s55)
    (step-successor s55 s56) (step-successor s56 s57) (step-successor s57 s58)
    (step-successor s58 s59) (step-successor s59 s60) (step-successor s60 s61)
    (step-successor s61 s62) (step-successor s62 s63) (step-successor s63 s64)

    ;; start at first step
    (current-step s1)
  )

  (:goal
    (and
      ;; full stack moved to right peg (same top-to-bottom ordering)
      (on d1 d2)
      (on d2 d3)
      (on d3 d4)
      (on d4 d5)
      (on d5 d6)
      (on d6 pegc)

      ;; left and middle pegs must be empty (no top disk)
      (clear pega)
      (clear pegb)

      ;; and plan must reach final step exactly
      (current-step s64)
    )
  )
)