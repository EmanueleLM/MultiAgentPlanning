(define (problem meet_emily_instance)
  (:domain meet_emily_san_francisco)

  (:objects
    north_beach alamo_square - location
    emily - person
    t_0900 t_1914 t_1930 t_1945 t_2100 - time
  )

  (:init
    (at north_beach)
    (current_time t_0900)

    (connected north_beach alamo_square)
    (connected alamo_square north_beach)

    (wait_step t_0900 t_1914)
    (wait_step t_0900 t_1930)
    (wait_step t_0900 t_1945)
    (wait_step t_0900 t_2100)
    (wait_step t_1914 t_1930)
    (wait_step t_1930 t_1945)
    (wait_step t_1945 t_2100)

    (travel_step north_beach alamo_square t_1914 t_1930)

    (meeting_step emily alamo_square t_1930 t_1945)
  )

  (:goal
    (and
      (met emily)
    )
  )
)