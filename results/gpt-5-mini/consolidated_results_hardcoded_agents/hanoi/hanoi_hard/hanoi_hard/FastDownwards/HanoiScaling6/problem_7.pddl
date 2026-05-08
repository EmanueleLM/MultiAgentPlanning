(define (problem hanoi-6)
  (:domain hanoi)

  (:objects
    diskA diskB diskC diskD diskE diskF - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9
    s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
    s20 s21 s22 s23 s24 s25 s26 s27 s28 s29
    s30 s31 s32 s33 s34 s35 s36 s37 s38 s39
    s40 s41 s42 s43 s44 s45 s46 s47 s48 s49
    s50 s51 s52 s53 s54 s55 s56 s57 s58 s59
    s60 s61 s62 s63 - stage
  )

  (:init
    ;; initial stack on left: top->bottom diskA, diskB, diskC, diskD, diskE, diskF
    (on-disk diskA diskB)
    (on-disk diskB diskC)
    (on-disk diskC diskD)
    (on-disk diskD diskE)
    (on-disk diskE diskF)
    (on-peg diskF left)

    ;; Clear/top facts initially: only the very top disk and the empty pegs are clear
    (clear-disk diskA)
    ;; other disks are not clear (implicitly false) -> do not assert
    (clear-peg middle)
    (clear-peg right)
    ;; left peg initially occupied at bottom (not clear) -> do not assert

    ;; static size ordering (smaller < larger)
    (smaller diskA diskB) (smaller diskA diskC) (smaller diskA diskD) (smaller diskA diskE) (smaller diskA diskF)
    (smaller diskB diskC) (smaller diskB diskD) (smaller diskB diskE) (smaller diskB diskF)
    (smaller diskC diskD) (smaller diskC diskE) (smaller diskC diskF)
    (smaller diskD diskE) (smaller diskD diskF)
    (smaller diskE diskF)

    ;; stage progression chain: s0 -> s1 -> ... -> s63 (63 moves allowed: 2^6 - 1)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9)
    (succ s9 s10) (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15) (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19)
    (succ s19 s20) (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25) (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29)
    (succ s29 s30) (succ s30 s31) (succ s31 s32) (succ s32 s33) (succ s33 s34) (succ s34 s35) (succ s35 s36) (succ s36 s37) (succ s37 s38) (succ s38 s39)
    (succ s39 s40) (succ s40 s41) (succ s41 s42) (succ s42 s43) (succ s43 s44) (succ s44 s45) (succ s45 s46) (succ s46 s47) (succ s47 s48) (succ s48 s49)
    (succ s49 s50) (succ s50 s51) (succ s51 s52) (succ s52 s53) (succ s53 s54) (succ s54 s55) (succ s55 s56) (succ s56 s57) (succ s57 s58) (succ s58 s59)
    (succ s59 s60) (succ s60 s61) (succ s61 s62) (succ s62 s63)

    ;; start at stage s0
    (current s0)
  )

  (:goal (and
    ;; final stack on right: bottom diskF on right, then diskE on diskF, ..., diskA on diskB
    (on-peg diskF right)
    (on-disk diskE diskF)
    (on-disk diskD diskE)
    (on-disk diskC diskD)
    (on-disk diskB diskC)
    (on-disk diskA diskB)

    ;; require both left and middle pegs to be empty at the end
    (clear-peg left)
    (clear-peg middle)

    ;; final stage reached (enforces contiguous single-action-per-stage progression)
    (current s63)
  ))