(define (problem san_francisco_robert_meeting_instance)
  (:domain san_francisco_robert_meeting)

  (:objects
    you - traveler
    robert - friend
    haight_ashbury north_beach - location
    t_0900 t_1630 t_1800 t_2130 - timepoint
  )

  (:init
    (at you haight_ashbury)
    (friend_at robert north_beach)
    (current_time t_0900)

    (available_at robert t_1630)
    (available_at robert t_1800)
    (available_at robert t_2130)

    (can_travel_by haight_ashbury north_beach t_0900 t_1630)
  )

  (:goal
    (and
      (met_90 robert)
      (at you north_beach)
      (current_time t_1800)
    )
  )
)