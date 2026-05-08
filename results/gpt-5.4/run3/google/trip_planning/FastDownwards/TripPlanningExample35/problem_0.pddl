(define (problem trip_europe_10_days_instance_problem)
  (:domain trip_europe_10_days_instance)

  (:objects
    bucharest zurich dubrovnik - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 - day
  )

  (:init
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)

    (current_day day_1)

    (direct_flight bucharest zurich)
    (direct_flight zurich bucharest)
    (direct_flight zurich dubrovnik)
    (direct_flight dubrovnik zurich)

    (bucharest_count_0)
    (zurich_count_0)
    (dubrovnik_count_0)
  )

  (:goal
    (and
      (current_day day_10)
      (bucharest_count_3)
      (zurich_count_2)
      (dubrovnik_count_7)
      (relatives_visited)
    )
  )
)