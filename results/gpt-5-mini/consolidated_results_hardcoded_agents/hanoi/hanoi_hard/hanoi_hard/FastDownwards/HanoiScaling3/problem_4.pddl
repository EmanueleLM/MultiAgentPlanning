(define (problem hanoi-3peg-6disk)
  (:domain hanoi-multiagent)

  (:objects
    d1 d2 d3 d4 d5 d6 - disk
    pega pegb pegc - peg
    player auditor - agent
    s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59 s60 s61 s62 s63 s64 - step
  )

  (:init
    ;; agents
    (hanoi_player_agent player)
    (auditor_agent auditor)

    ;; initial stacking on pega (left): bottom d6 on pega, then d5 on d6, ..., top d1 on d2
    (on d6 pega)
    (on d5 d6)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; initially only the topmost disk and the empty pegs are clear
    (clear d1)
    (clear pegb)
    (clear pegc)

    ;; size ordering: disk-to-disk (smaller)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)

    ;; every disk is smaller than each peg (allows placing any disk on an empty peg)
    (smaller d1 pega) (smaller d1 pegb) (smaller d1 pegc)
    (smaller d2 pega) (smaller d2 pegb) (smaller d2 pegc)
    (smaller d3 pega) (smaller d3 pegb) (smaller d3 pegc)
    (smaller d4 pega) (smaller d4 pegb) (smaller d4 pegc)
    (smaller d5 pega) (smaller d5 pegb) (smaller d5 pegc)
    (smaller d6 pega) (smaller d6 pegb) (smaller d6 pegc)

    ;; sequencing: link each step i to i+1 for 63 moves (2^6 - 1 = 63)
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

    ;; start at the first step token
    (current-step s1)
  )

  (:goal
    (and
      ;; final stacked state on pegc (right): bottom d6 on pegc, then d5 on d6, ..., top d1 on d2
      (on d6 pegc)
      (on d5 d6)
      (on d4 d5)
      (on d3 d4)
      (on d2 d3)
      (on d1 d2)
      ;; require left (pega) and middle (pegb) pegs be empty at the end (no disk directly on them)
      (clear pega)
      (clear pegb)
      ;; and the entire move sequence consumed (reached final step token)
      (current-step s64)
    )
  )
)