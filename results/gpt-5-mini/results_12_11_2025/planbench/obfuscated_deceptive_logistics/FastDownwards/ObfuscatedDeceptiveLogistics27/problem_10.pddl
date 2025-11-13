(define (problem obfuscated-deceptive-logistics27-problem)
  (:domain obfuscated-deceptive-logistics27)

  (:objects
    ;; typed domain objects
    object_12 object_13 object_14 - hand
    object_0 object_1            - cat
    object_4 object_5            - sneeze
    object_2 object_3            - stupendous
    object_6 object_7 object_8 object_9 object_10 object_11 - texture

    ;; explicit discrete stages to enforce serial, contiguous progression
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 - stage
  )

  (:init
    ;; collect facts (used by wretched)
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_2)
    (collect object_9 object_3)
    (collect object_10 object_3)
    (collect object_11 object_3)

    ;; spring facts (used by memory)
    (spring object_6)
    (spring object_9)

    ;; initial next relations (canonicalized)
    (next object_0 object_9)
    (next object_1 object_6)
    (next object_12 object_11)
    (next object_13 object_8)
    (next object_14 object_8)
    (next object_4 object_7)
    (next object_5 object_10)

    ;; initial stage availability: start at s0
    (stage-available s0)

    ;; explicit successor (ordered stages) chain to enforce contiguous single-action progression
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5)
    (succ s5 s6) (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10)
    (succ s10 s11) (succ s11 s12) (succ s12 s13) (succ s13 s14) (succ s14 s15)
    (succ s15 s16) (succ s16 s17) (succ s17 s18) (succ s18 s19) (succ s19 s20)
    (succ s20 s21) (succ s21 s22) (succ s22 s23) (succ s23 s24)
  )

  (:goal (and
    (next object_12 object_6)
    (next object_13 object_10)
    (next object_14 object_11)
  ))
)