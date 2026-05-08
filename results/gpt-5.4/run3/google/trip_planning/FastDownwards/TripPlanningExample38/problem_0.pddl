(define (problem european_trip_5_day_instance_problem)
  (:domain european_trip_5_day_instance)

  (:objects
    geneva madrid venice - city
    day_1 day_2 day_3 day_4 day_5 - day
  )

  (:init
    (direct_flight geneva madrid)
    (direct_flight madrid geneva)
    (direct_flight madrid venice)
    (direct_flight venice madrid)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)

    (current_day day_1)
    (start_choice_pending)
    (used_city_count_0)
  )

  (:goal
    (and
      (day_assigned day_1)
      (day_assigned day_2)
      (day_assigned day_3)
      (day_assigned day_4)
      (day_assigned day_5)

      (spent_day_in day_4 venice)
      (spent_day_in day_5 venice)

      (spent_day_in day_1 geneva)
      (spent_day_in day_2 geneva)

      (spent_day_in day_3 madrid)
      (spent_day_in day_4 madrid)
      (spent_day_in day_5 madrid)

      (city_used geneva)
      (city_used madrid)
      (city_used venice)
      (used_city_count_3)

      (not (current_day day_1))
      (not (current_day day_2))
      (not (current_day day_3))
      (not (current_day day_4))
      (not (current_day day_5))
    )
  )
)