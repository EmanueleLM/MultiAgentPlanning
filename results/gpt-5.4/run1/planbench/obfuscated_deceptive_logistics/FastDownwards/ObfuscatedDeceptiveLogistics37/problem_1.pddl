(define (problem jack_of_all_trades_instance_problem)
  (:domain jack_of_all_trades_instance)

  (:objects
    object_0 - cats_obj
    object_1 object_2 - stupendous_obj
    object_3 object_4 - sneeze_obj
    object_5 object_8 - spring_obj
    object_6 object_7 object_9 object_10 - texture_obj
    object_11 object_12 object_13 object_14 object_15 object_16 - hand_obj
  )

  (:init
    (collect object_10 object_2)
    (collect object_5 object_1)
    (collect object_6 object_1)
    (collect object_7 object_1)
    (collect object_8 object_2)
    (collect object_9 object_2)

    (next object_0 object_5)
    (next object_11 object_8)
    (next object_12 object_9)
    (next object_13 object_10)
    (next object_14 object_9)
    (next object_15 object_6)
    (next object_16 object_6)
    (next object_3 object_5)
    (next object_4 object_9)
  )

  (:goal
    (and
      (next object_11 object_5)
      (next object_12 object_9)
      (next object_13 object_7)
      (next object_14 object_5)
      (next object_15 object_8)
      (next object_16 object_6)
    )
  )
)