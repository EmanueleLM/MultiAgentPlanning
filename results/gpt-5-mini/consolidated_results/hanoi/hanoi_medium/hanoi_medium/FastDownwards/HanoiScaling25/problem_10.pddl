(define (problem hanoi-5-instance)
  (:domain tower-of-hanoi-5)

  (:objects
    da db dc dd de basel basem baser - disk
    pegL pegM pegR - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 - stage
  )

  (:init
    ; mark peg bases (immovable supports)
    (is-base basel)
    (is-base basem)
    (is-base baser)

    ; initial stacking on left peg (top-to-bottom: da db dc dd de, then base)
    (on da db)
    (on db dc)
    (on dc dd)
    (on dd de)
    (on de basel)

    ; top-of-peg facts: empty pegs have their base as top
    (top pegL da)
    (top pegM basem)
    (top pegR baser)

    ; size ordering among disks (A < B < C < D < E)
    (smaller da db) (smaller da dc) (smaller da dd) (smaller da de)
    (smaller db dc) (smaller db dd) (smaller db de)
    (smaller dc dd) (smaller dc de)
    (smaller dd de)

    ; every disk is smaller than every peg base (so any disk can be placed on an empty peg)
    (smaller da basel) (smaller da basem) (smaller da baser)
    (smaller db basel) (smaller db basem) (smaller db baser)
    (smaller dc basel) (smaller dc basem) (smaller dc baser)
    (smaller dd basel) (smaller dd basem) (smaller dd baser)
    (smaller de basel) (smaller de basem) (smaller de baser)

    ; explicit peg inequality facts (both directions to match parameter orders)
    (different pegL pegM) (different pegM pegL)
    (different pegL pegR) (different pegR pegL)
    (different pegM pegR) (different pegR pegM)

    ; ordered stages for discrete-time progression (s0 active initially, 31 moves maximum for 5 disks)
    (successor s0 s1) (successor s1 s2) (successor s2 s3) (successor s3 s4)
    (successor s4 s5) (successor s5 s6) (successor s6 s7) (successor s7 s8)
    (successor s8 s9) (successor s9 s10) (successor s10 s11) (successor s11 s12)
    (successor s12 s13) (successor s13 s14) (successor s14 s15) (successor s15 s16)
    (successor s16 s17) (successor s17 s18) (successor s18 s19) (successor s19 s20)
    (successor s20 s21) (successor s21 s22) (successor s22 s23) (successor s23 s24)
    (successor s24 s25) (successor s25 s26) (successor s26 s27) (successor s27 s28)
    (successor s28 s29) (successor s29 s30) (successor s30 s31)

    (stage-active s0)
  )

  (:goal (and
    ; goal stacking on middle peg (top-to-bottom: da db dc dd de, then middle base)
    (on da db)
    (on db dc)
    (on dc dd)
    (on dd de)
    (on de basem)

    ; top-of-peg facts reflect final emptiness of left and right pegs and filled middle peg
    (top pegM da)
    (top pegL basel)
    (top pegR baser)

    ; require the final stage to be active (ensures the plan used at most 31 moves and progressed stages)
    (stage-active s31)
  ))
)