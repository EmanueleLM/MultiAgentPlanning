(define (problem scenario1)
  (:domain orchestrated-collection)

  (:objects
    object_1 object_6 object_7 object_8 object_9
  )

  (:init
    ;; facts minimal to support the provided plan and goals
    (cats object_1)
    (spring object_6)
    (spring object_7)
    (next object_1 object_6)
    (hand object_9)
    (next object_9 object_7)
    (texture object_6)
    (texture object_7)
    (next object_8 object_7)
  )

  (:goal (and
    (next object_8 object_7)
    (next object_9 object_6)
  ))
)