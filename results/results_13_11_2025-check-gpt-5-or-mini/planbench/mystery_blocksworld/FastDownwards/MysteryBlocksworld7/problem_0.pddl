(define (problem mystery-a)
  (:domain mystery-objects)
  (:objects
    object_1 object_2 object_3 object_4 object_5
    object_6 object_7 object_8 object_9 object_10 - object
  )
  (:init
    (cats object_10)
    (cats object_6)
    (collect object_10)
    (vase object_6)
  )
  (:goal (and
    (next object_10 object_6)
  ))
)