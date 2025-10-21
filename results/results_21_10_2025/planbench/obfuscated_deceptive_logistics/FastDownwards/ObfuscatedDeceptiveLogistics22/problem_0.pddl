(define (problem variant-a)
  (:domain orchestrator-domain)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 object_11 object_12 - object
  )
  (:init
    ;; Dynamic links available initially to enable transformations via actions
    (next object_11 object_1)
    (next object_12 object_2)

    ;; Static predicates required by memory action to re-link next edges
    (cats object_11)
    (cats object_12)
    (spring object_1)
    (spring object_7)
    (spring object_2)
    (spring object_5)
    (spring object_8)
  )
  (:goal (and
    (next object_11 object_7)
    (next object_12 object_5)
  ))
)