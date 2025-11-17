(define (problem example-A)
  (:domain object-manipulation)
  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5 object_6 object_7 object_8 object_9 object_10 - obj
    time_0 time_1 time_2 time_3 time_4 time_5 time_6 time_7 time_8 time_9 time_10 - time
  )
  (:init
    ;; time chain and initial clock at time_0
    (succ time_0 time_1)
    (succ time_1 time_2)
    (succ time_2 time_3)
    (succ time_3 time_4)
    (succ time_4 time_5)
    (succ time_5 time_6)
    (succ time_6 time_7)
    (succ time_7 time_8)
    (succ time_8 time_9)
    (succ time_9 time_10)
    (now time_0)

    ;; unary properties
    (cats object_0)
    (cats object_1)
    (hand object_10)

    (sneeze object_4)
    (sneeze object_5)

    (spring object_6)
    (spring object_8)

    (stupendous object_2)
    (stupendous object_3)

    (texture object_6)
    (texture object_7)
    (texture object_8)
    (texture object_9)

    ;; binary relations
    (collect object_6 object_2)
    (collect object_7 object_2)
    (collect object_8 object_3)
    (collect object_9 object_3)

    (next object_0 object_8)
    (next object_1 object_6)
    (next object_10 object_9)
    (next object_4 object_6)
    (next object_5 object_9)
  )
  (:goal (and
    (next object_10 object_6)
  ))
)