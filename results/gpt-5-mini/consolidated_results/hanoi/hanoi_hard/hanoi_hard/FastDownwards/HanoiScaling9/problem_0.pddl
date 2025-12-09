(define (problem hanoi6-instance)
  (:domain hanoi-6)

  ;; Objects: disks d1..d6 (d1 smallest, d6 largest), pegs p1 p2 p3, steps s0..s63
  (:objects
     d1 d2 d3 d4 d5 d6 - obj
     p1 p2 p3 - obj
     s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
     s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39
     s40 s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59
     s60 s61 s62 s63 - obj
  )

  (:init
    ;; classification facts
    (disk d1) (disk d2) (disk d3) (disk d4) (disk d5) (disk d6)
    (peg p1) (peg p2) (peg p3)
    (step s0) (step s1) (step s2) (step s3) (step s4) (step s5) (step s6) (step s7) (step s8) (step s9)
    (step s10) (step s11) (step s12) (step s13) (step s14) (step s15) (step s16) (step s17) (step s18) (step s19)
    (step s20) (step s21) (step s22) (step s23) (step s24) (step s25) (step s26) (step s27) (step s28) (step s29)
    (step s30) (step s31) (step s32) (step s33) (step s34) (step s35) (step s36) (step s37) (step s38) (step s39)
    (step s40) (step s41) (step s42) (step s43) (step s44) (step s45) (step s46) (step s47) (step s48) (step s49)
    (step s50) (step s51) (step s52) (step s53) (step s54) (step s55) (step s56) (step s57) (step s58) (step s59)
    (step s60) (step s61) (step s62) (step s63)

    ;; successor (step) chain enforces move ordering and contiguity: s0->s1->...->s63
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15) (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25) (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30)
    (succ s30 s31) (succ s31 s32) (succ s32 s33) (succ s33 s34) (succ s34 s35) (succ s35 s36) (succ s36 s37) (succ s37 s38) (succ s38 s39) (succ s39 s40)
    (succ s40 s41) (succ s41 s42) (succ s42 s43) (succ s43 s44) (succ s44 s45) (succ s45 s46) (succ s46 s47) (succ s47 s48) (succ s48 s49) (succ s49 s50)
    (succ s50 s51) (succ s51 s52) (succ s52 s53) (succ s53 s54) (succ s54 s55) (succ s55 s56) (succ s56 s57) (succ s57 s58) (succ s58 s59) (succ s59 s60)
    (succ s60 s61) (succ s61 s62) (succ s62 s63)

    ;; initial step token: exactly one step active -> enforces one action per step
    (at-step s0)

    ;; initial stacking on peg p1 (largest d6 at bottom, smallest d1 at top)
    (on d6 p1)
    (on d5 d6)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; top-of-stack and clear facts
    (clear d1)    ;; only the smallest disk at top is clear initially
    (clear p2) (clear p3)  ;; empty pegs are clear

    ;; size ordering: smaller relations for all i<j (explicit, used as hard constraints)
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6)
    (smaller d4 d5) (smaller d4 d6)
    (smaller d5 d6)
  )

  (:goal
    (and
      ;; final tower must be on peg p3 with same ordering d6 bottom -> d1 top
      (on d6 p3)
      (on d5 d6)
      (on d4 d5)
      (on d3 d4)
      (on d2 d3)
      (on d1 d2)

      ;; final step token: require exactly 63 moves have occurred (s63 is reached)
      (at-step s63)
    )
  )
)