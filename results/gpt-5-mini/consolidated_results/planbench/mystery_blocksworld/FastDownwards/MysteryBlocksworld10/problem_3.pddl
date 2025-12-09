(define (problem orchestrated-problem)
  (:domain orchestrated-domain)

  (:objects
    object_a object_b object_c object_d - object
    province_a province_b province_c - province
    stage1 stage2 stage3 stage4 stage5 - stage
  )

  (:init
    ;; Harmony and initial craving
    (harmony)
    (craves object_b object_d)

    ;; Planet classifications
    (planet object_a)
    (planet object_c)
    (planet object_d)

    ;; Initial province control
    (controls object_a province_a)
    (controls object_b province_b)
    (controls object_c province_c)

    ;; Stage ordering (discrete time) and initial current stage
    (next stage1 stage2)
    (next stage2 stage3)
    (next stage3 stage4)
    (next stage4 stage5)
    (current stage1)
  )

  (:goal (and
    (craves object_b object_c)
    (craves object_d object_a)
  ))
)