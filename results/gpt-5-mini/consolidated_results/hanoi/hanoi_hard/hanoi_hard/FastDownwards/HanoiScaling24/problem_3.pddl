(define (problem hanoi-6-instance)
  (:domain hanoi)
  (:objects
    diskA diskB diskC diskD diskE diskF
    left middle right

    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9
    s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
    s20 s21 s22 s23 s24 s25 s26 s27 s28 s29
    s30 s31 s32 s33 s34 s35 s36 s37 s38 s39
    s40 s41 s42 s43 s44 s45 s46 s47 s48 s49
    s50 s51 s52 s53 s54 s55 s56 s57 s58 s59
    s60 s61 s62 s63
  )

  (:init
    ;; declare disks and pegs
    (disk diskA) (disk diskB) (disk diskC) (disk diskD) (disk diskE) (disk diskF)
    (peg left) (peg middle) (peg right)

    ;; Initial tower on middle peg: top A, then B, C, D, E, bottom F on peg middle
    (on diskA diskB)
    (on diskB diskC)
    (on diskC diskD)
    (on diskD diskE)
    (on diskE diskF)
    (on diskF middle)

    ;; Initially clear: top disk and empty pegs (top disk A clear, left and right empty)
    (clear diskA)
    (clear left)
    (clear right)

    ;; Size ordering: A < B < C < D < E < F (pairwise facts)
    (smaller diskA diskB) (smaller diskA diskC) (smaller diskA diskD) (smaller diskA diskE) (smaller diskA diskF)
    (smaller diskB diskC) (smaller diskB diskD) (smaller diskB diskE) (smaller diskB diskF)
    (smaller diskC diskD) (smaller diskC diskE) (smaller diskC diskF)
    (smaller diskD diskE) (smaller diskD diskF)
    (smaller diskE diskF)

    ;; Step successor relation enforcing contiguous single-step progression s0 -> s1 -> ... -> s63
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9)
    (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16) (next s16 s17) (next s17 s18) (next s18 s19)
    (next s19 s20) (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24) (next s24 s25) (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29)
    (next s29 s30) (next s30 s31) (next s31 s32) (next s32 s33) (next s33 s34) (next s34 s35) (next s35 s36) (next s36 s37) (next s37 s38) (next s38 s39)
    (next s39 s40) (next s40 s41) (next s41 s42) (next s42 s43) (next s43 s44) (next s44 s45) (next s45 s46) (next s46 s47) (next s47 s48) (next s48 s49)
    (next s49 s50) (next s50 s51) (next s51 s52) (next s52 s53) (next s53 s54) (next s54 s55) (next s55 s56) (next s56 s57) (next s57 s58) (next s58 s59)
    (next s59 s60) (next s60 s61) (next s61 s62) (next s62 s63)

    ;; Initial step marker
    (at-step s0)
  )

  (:goal (and
    ;; Goal tower on right peg: top A, then B, C, D, E, bottom F on peg right
    (on diskA diskB)
    (on diskB diskC)
    (on diskC diskD)
    (on diskD diskE)
    (on diskE diskF)
    (on diskF right)

    ;; Require exactly 63 moves: final step is s63
    (at-step s63)

    ;; Left and middle pegs must be empty (clear)
    (clear left)
    (clear middle)

    ;; Top disk must be clear
    (clear diskA)
  ))
)