(define (problem san_francisco_meet_sarah_instance)
  (:domain san_francisco_meet_sarah)

  (:objects
    you - traveler
    sarah - friend
    sunset_district union_square - location
    t_900 t_930 t_1200 t_1230 t_1245 - time
  )

  (:init
    (at you sunset_district)
    (current_time t_900)

    (wait_link sunset_district t_900 t_930)
    (wait_link sunset_district t_930 t_1200)
    (wait_link union_square t_1230 t_1245)

    (travel_link sunset_district union_square t_1200 t_1230)

    (available sarah union_square t_1230)
    (available sarah union_square t_1245)
  )

  (:goal
    (and
      (met sarah)
    )
  )
)