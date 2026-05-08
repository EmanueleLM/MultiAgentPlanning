(define (problem san_francisco_meet_robert_instance)
  (:domain san_francisco_meet_robert)

  (:objects
    you - traveler
    robert - friend
    haight_ashbury north_beach - location
    t_0900 t_0919 t_1630 t_1648 t_1800 t_1818 t_1930 t_1949 t_2130 - time
  )

  (:init
    (at_traveler you haight_ashbury)
    (at_friend robert north_beach)
    (current_time t_0900)

    (next_time t_0900 t_0919)
    (next_time t_0919 t_1630)
    (next_time t_1630 t_1648)
    (next_time t_1648 t_1800)
    (next_time t_1800 t_1818)
    (next_time t_1818 t_1930)
    (next_time t_1930 t_1949)
    (next_time t_1949 t_2130)

    (travel_haight_to_north t_0900 t_0919)

    (travel_north_to_haight t_1630 t_1648)
    (travel_north_to_haight t_1800 t_1818)

    (meet90_start t_1630 t_1800)
    (meet90_start t_1800 t_1930)

    (available_start robert t_1630)
    (available_start robert t_1800)
  )

  (:goal
    (and
      (met_minimum robert)
    )
  )
)