(define (problem logistics1-problem0)
  (:domain Logistics1)
  (:objects
    object_1 object_6 object_7 object_8 - obj
  )
  (:init
    ;; Only the facts required to support the plan to achieve (next object_8 object_6)
    (cats object_1)
    (hand object_8)
    (texture object_6)
    (texture object_7)
    (spring object_6)
    (spring object_7)
    (next object_8 object_7)
    (next object_1 object_7)
  )
  (:goal (and
    (next object_8 object_6)
  ))
)