(define (problem orchestrator-problem-1)
  (:domain orchestrator)
  (:objects
    object_11 object_1 object_7 object_12 object_2 object_5
  )
  (:init
    (cats object_11)
    (spring object_1)
    (spring object_7)
    (next object_11 object_1)
    (cats object_12)
    (spring object_2)
    (spring object_5)
    (next object_12 object_2)
  )
  (:goal (and
    (next object_11 object_7)
    (next object_12 object_5)
  ))
)