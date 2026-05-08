(define (problem trip_planning_example0_problem)
  (:domain trip_planning_example0)

  (:objects
    barcelona helsinki - city
    day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day
  )

  (:init
    (direct barcelona florence)
    (direct florence barcelona)
    (direct barcelona helsinki)
    (direct helsinki barcelona)

    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)
    (next day_8 day_9)
    (next day_9 day_10)
    (next day_10 day_11)
    (next day_11 day_12)
    (next day_12 day_13)
    (next day_13 day_14)

    (friend_window day_9)
    (friend_window day_10)
    (friend_window day_11)
    (friend_window day_12)
    (friend_window day_13)
    (friend_window day_14)

    (at barcelona)
    (current_day day_1)
    (visited day_1 barcelona)

    (needs_visit barcelona)
    (needs_visit florence)
    (needs_visit helsinki)

    (remaining_city_day barcelona day_5)
    (remaining_city_day florence day_6)
    (remaining_city_day helsinki day_5)
  )

  (:goal
    (and
      (current_day day_14)
      (not (needs_visit barcelona))
      (not (needs_visit florence))
      (not (needs_visit helsinki))
      (friend_met)
    )
  )
)