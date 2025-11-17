(define (problem scenario_1)
  (:domain next-vase-domain)
  (:objects
    object_6 object_7 object_8 - obj
  )
  (:init
    ;; Minimal initial facts: goal already satisfied
    (next object_7 object_6)
    (next object_8 object_6)
  )
  (:goal (and (next object_7 object_6) (next object_8 object_6)))
)