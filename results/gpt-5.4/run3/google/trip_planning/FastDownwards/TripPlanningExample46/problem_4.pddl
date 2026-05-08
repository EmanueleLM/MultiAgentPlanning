(define (problem trip_planning_example46_instance)
  (:domain trip_planning_example46)

  (:objects
    seville manchester stockholm - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (current_day day_1)
    (at stockholm)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)
    (last_day day_11)

    (direct manchester seville)
    (direct seville manchester)
    (direct stockholm manchester)
    (direct manchester stockholm)

    (need_seville_5)
    (need_manchester_5)
    (need_stockholm_3)
  )

  (:goal
    (and
      (finished)
      (need_seville_0)
      (need_manchester_0)
      (need_stockholm_0)
      (in_city_on day_1 stockholm)
      (in_city_on day_3 stockholm)
    )
  )
)