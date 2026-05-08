(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    you - traveler
    joshua - friend
    union_square chinatown - location
    t0900 t0907 t1800 t1915 - time
  )

  (:init
    (at you union_square)
    (current_time t0900)

    (connected union_square chinatown)
    (connected chinatown union_square)

    (travel_time_7 union_square chinatown t0900 t0907)

    (next_time t0907 t1800)

    (meeting_slot joshua chinatown t1800 t1915)
  )

  (:goal
    (and
      (met joshua)
      (current_time t1915)
      (at you chinatown)
    )
  )
)