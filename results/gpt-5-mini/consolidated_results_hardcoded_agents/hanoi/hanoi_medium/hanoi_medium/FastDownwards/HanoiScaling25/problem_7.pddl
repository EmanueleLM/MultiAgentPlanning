(define (problem hanoi-5-instance)
  (:domain tower-of-hanoi-5)

  (:objects
    ;; movable disks: smallest to largest
    da db dc dd de
    ;; base sentinel objects (typed as disk)
    basel basem baser
    - disk

    pegL pegM pegR - peg

    ;; discrete stages: s0 .. s31 (31 moves required for 5 disks)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31
    - stage
  )

  (:init
    ;; base sentinels
    (is-base basel)
    (is-base basem)
    (is-base baser)

    ;; initial stacking on left peg (pegL) from top to bottom: da, db, dc, dd, de, base
    (on da db)
    (on db dc)
    (on dc dd)
    (on dd de)
    (on de basel)

    ;; peg tops (empty pegs use their base sentinel as top)
    (top pegL da)
    (top pegM basem)
    (top pegR baser)

    ;; strict size ordering for movable disks: da < db < dc < dd < de
    (smaller da db) (smaller da dc) (smaller da dd) (smaller da de)
    (smaller db dc) (smaller db dd) (smaller db de)
    (smaller dc dd) (smaller dc de)
    (smaller dd de)

    ;; explicit distinctness facts for pegs (both directions to avoid relying on equality)
    (different pegL pegM) (different pegM pegL)
    (different pegL pegR) (different pegR pegL)
    (different pegM pegR) (different pegR pegM)

    ;; stage ordering chain
    (successor s0 s1) (successor s1 s2) (successor s2 s3) (successor s3 s4)
    (successor s4 s5) (successor s5 s6) (successor s6 s7) (successor s7 s8)
    (successor s8 s9) (successor s9 s10) (successor s10 s11) (successor s11 s12)
    (successor s12 s13) (successor s13 s14) (successor s14 s15) (successor s15 s16)
    (successor s16 s17) (successor s17 s18) (successor s18 s19) (successor s19 s20)
    (successor s20 s21) (successor s21 s22) (successor s22 s23) (successor s23 s24)
    (successor s24 s25) (successor s25 s26) (successor s26 s27) (successor s27 s28)
    (successor s28 s29) (successor s29 s30) (successor s30 s31)

    ;; initial active stage
    (stage-active s0)
  )

  (:goal (and
    ;; desired stacking on middle peg (pegM) from top to bottom: da, db, dc, dd, de, base
    (on da db)
    (on db dc)
    (on dc dd)
    (on dd de)
    (on de basem)

    ;; peg tops: middle peg top is da; left and right pegs empty (their bases are top)
    (top pegM da)
    (top pegL basel)
    (top pegR baser)

    ;; final stage must be active: enforces exactly 31 successive move actions to reach goal
    (stage-active s31)
  ))