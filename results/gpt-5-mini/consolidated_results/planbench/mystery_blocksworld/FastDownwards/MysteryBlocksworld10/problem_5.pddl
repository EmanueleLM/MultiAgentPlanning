(define (problem orchestrated-problem)
  (:domain orchestrated-domain)

  (:objects
    object_a object_b object_c object_d - object
    province_a province_b province_c - province
    stage1 stage2 stage3 stage4 stage5 - stage
  )

  (:init
    (harmony)
    (craves object_b object_d)
    (planet object_a)
    (planet object_c)
    (planet object_d)
    (controls object_a province_a)
    (controls object_b province_b)
    (controls object_c province_c)
    (orig-province object_a province_a)
    (orig-province object_b province_b)
    (orig-province object_c province_c)
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