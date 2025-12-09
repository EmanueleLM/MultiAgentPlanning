(define (problem hanoi-5-instance)
  (:domain tower-of-hanoi-5)

  (:objects
    ;; disks: from smallest to largest dA, dB, dC, dD, dE
    dA dB dC dD dE
    ;; base sentinels (one per peg) used as the bottom support of an empty peg
    baseL baseM baseR
    - disk

    pegL pegM pegR - peg

    ;; discrete stages (exactly 31 moves required for 5 disks: s0 .. s31)
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31
    - stage
  )

  (:init
    ;; base sentinel markers
    (is-base baseL)
    (is-base baseM)
    (is-base baseR)

    ;; initial stacking on left peg (pegL) from top to bottom: dA (top), dB, dC, dD, dE (bottom)
    ;; direct support facts (upper directly on lower). Note: bottom-most disk is on the base sentinel.
    (on dA dB)
    (on dB dC)
    (on dC dD)
    (on dD dE)
    (on dE baseL)

    ;; tops: pegL top is dA; other pegs are empty (top is their base sentinel)
    (top pegL dA)
    (top pegM baseM)
    (top pegR baseR)

    ;; strict size ordering (smaller relations). A < B < C < D < E
    (smaller dA dB) (smaller dA dC) (smaller dA dD) (smaller dA dE)
    (smaller dB dC) (smaller dB dD) (smaller dB dE)
    (smaller dC dD) (smaller dC dE)
    (smaller dD dE)

    ;; stage ordering: linear chain s0 -> s1 -> ... -> s31
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
    ;; desired stacking on middle peg (pegM) from top to bottom: dA, dB, dC, dD, dE
    (on dA dB)
    (on dB dC)
    (on dC dD)
    (on dD dE)
    (on dE baseM)

    ;; top facts: pegM top is dA; left and right pegs must be empty (their tops are their bases)
    (top pegM dA)
    (top pegL baseL)
    (top pegR baseR)

    ;; final stage must be active: enforces exactly 31 successive moves to reach goal
    (stage-active s31)
  ))
)