(define (problem scenario1)
  (:domain multi-agent-next)
  (:objects
    object_7 object_10 object_11 object_12 - object
  )
  (:init
    ;; Assumed initial facts (minimal):
    (next object_11 object_7)
    (next object_10 object_11)
    (next object_12 object_11)
    (cats object_10)
    (cats object_12)
    (spring object_11)
    (spring object_7)
  )
  (:goal (and
    (next object_10 object_7)
    (next object_11 object_7)
    (next object_12 object_7)
  ))
)