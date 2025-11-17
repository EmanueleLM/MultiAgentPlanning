(define (problem logistics1-problem0)
  (:domain Logistics1)
  (:objects
    object_5 object_6 object_7 object_8 - obj
  )
  (:init
    ;; Minimal initial facts needed to achieve the goals:
    ;; object_7 already points to object_6, and object_8 can be advanced from object_5 to object_6 via memory
    (next object_7 object_6)
    (next object_8 object_5)
    (cats object_8)
    (spring object_5)
    (spring object_6)
  )
  (:goal (and
    (next object_7 object_6)
    (next object_8 object_6)
  ))
)