(define (problem european_trip_8_days_instance_problem)
  (:domain european_trip_8_days_instance)

  (:objects
    london bucharest riga - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 - day
  )

  (:init
    (current_day day_1)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)

    (direct_flight london bucharest)
    (direct_flight bucharest london)
    (direct_flight bucharest riga)
    (direct_flight riga bucharest)

    (workshop_day day_5)
    (workshop_day day_6)
    (workshop_day day_7)
    (workshop_day day_8)

    (london_count_0)
    (bucharest_count_0)
    (riga_count_0)
  )

  (:goal
    (and
      (current_day day_9)
      (london_count_3)
      (bucharest_count_3)
      (riga_count_4)
      (workshop_attended)
    )
  )
)