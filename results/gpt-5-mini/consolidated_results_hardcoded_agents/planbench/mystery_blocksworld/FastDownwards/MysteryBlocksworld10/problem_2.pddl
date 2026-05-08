(define (problem orchestrated-problem)
  (:domain orchestrated-domain)

  (:objects
    object_a object_b object_c object_d - object
    province_a province_b province_c - province
  )

  (:init
    ;; Minimal initial facts: harmony, a single given craving, and only the controls needed
    (harmony)
    (craves object_b object_d)

    ;; Initial controllers (only those required to make the goal reachable)
    (controls object_a province_a)
    (controls object_b province_b)
    (controls object_c province_c)
  )

  (:goal (and
    (craves object_b object_c)
    (craves object_d object_a)
  ))
)