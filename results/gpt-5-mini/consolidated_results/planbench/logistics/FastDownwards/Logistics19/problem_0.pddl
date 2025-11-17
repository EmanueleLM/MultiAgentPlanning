(define (problem scenario1)
  (:domain linking)
  (:objects
    object_9 object_10 object_11 - object
  )
  (:init
    (different object_9 object_10)
    (different object_9 object_11)
    (different object_10 object_9)
    (different object_10 object_11)
    (different object_11 object_9)
    (different object_11 object_10)
  )
  (:goal (and
    (next object_11 object_10)
    (next object_11 object_9)
  ))
)