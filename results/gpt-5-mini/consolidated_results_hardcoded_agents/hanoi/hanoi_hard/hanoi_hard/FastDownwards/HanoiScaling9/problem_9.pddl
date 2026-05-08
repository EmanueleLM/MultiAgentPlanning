(define (problem hanoi6-instance)
  (:domain hanoi-6)

  (:objects
     da db dc dd de df - disk
     peg_left peg_mid peg_right - peg
     p_peg_left p_peg_mid p_peg_right - place
     s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
     s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39
     s40 s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59
     s60 s61 s62 s63 - step
  )

  (:init
    ;; Relate peg objects to place type so pegs are usable where a place is required.
    ;; The domain types require a place for 'on' and 'clear'. We instantiate the pegs as places.
    ;; Using explicit place objects that correspond to pegs ensures typing is explicit and unambiguous.
    ;; (Note: p_peg_* are aliases representing the peg places; actions and predicates use places for supports.)
    ;; Map disks and peg-places by equality through facts: we assert that peg places have no disk on them initially except where specified.

    ;; successor chain s0->s1->...->s63
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15) (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24) (succ s24 s25) (succ s25 s26) (succ s26 s27) (succ s27 s28) (succ s28 s29) (succ s29 s30)
    (succ s30 s31) (succ s31 s32) (succ s32 s33) (succ s33 s34) (succ s34 s35) (succ s35 s36) (succ s36 s37) (succ s37 s38) (succ s38 s39) (succ s39 s40)
    (succ s40 s41) (succ s41 s42) (succ s42 s43) (succ s43 s44) (succ s44 s45) (succ s45 s46) (succ s46 s47) (succ s47 s48) (succ s48 s49) (succ s49 s50)
    (succ s50 s51) (succ s51 s52) (succ s52 s53) (succ s53 s54) (succ s54 s55) (succ s55 s56) (succ s56 s57) (succ s57 s58) (succ s58 s59) (succ s59 s60)
    (succ s60 s61) (succ s61 s62) (succ s62 s63)

    ;; initial active step
    (at-step s0)

    ;; initial stacking: middle peg holds, top-to-bottom: da (smallest) ... df (largest)
    ;; Use peg place p_peg_mid as the place representing the middle peg.
    (on da db)
    (on db dc)
    (on dc dd)
    (on dd de)
    (on de df)
    (on df p_peg_mid)

    ;; initial clearness: top disk da is clear; empty peg places are clear
    (clear da)
    (clear p_peg_left) (clear p_peg_right)

    ;; static size ordering (all necessary pairs a < b)
    (smaller da db) (smaller da dc) (smaller da dd) (smaller da de) (smaller da df)
    (smaller db dc) (smaller db dd) (smaller db de) (smaller db df)
    (smaller dc dd) (smaller dc de) (smaller dc df)
    (smaller dd de) (smaller dd df)
    (smaller de df)

    ;; Connect peg objects to their place aliases by asserting that the pegs correspond to these place objects.
    ;; The domain's actions operate over places; to allow the planner to use named pegs, we include the following facts
    ;; which identify the intended place objects for each peg name.
    ;; We use (on ?d ?p) where ?p must be a place; p_peg_* are those place objects.
    ;; There is no separate predicate linking pegs to places; the naming convention here provides the required place objects.
    ;; (No additional facts needed beyond using the p_peg_* names as place objects.)
  )

  (:goal
    (and
      ;; final tower must be on right peg place with same ordering df bottom -> da top
      (on da db)
      (on db dc)
      (on dc dd)
      (on dd de)
      (on de df)
      (on df p_peg_right)

      ;; left and middle peg places must be empty (clear)
      (clear p_peg_left)
      (clear p_peg_mid)

      ;; require the final stage to have been reached (exactly 63 single-disk moves)
      (at-step s63)
    )
  )
)