(define (problem trip_europe_8_days_instance_problem)
  (:domain trip_europe_8_days_instance)

  (:objects
    traveler_1 - traveler
    oslo reykjavik manchester - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 - day
  )

  (:init
    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)

    (direct_flight oslo reykjavik)
    (direct_flight reykjavik oslo)
    (direct_flight manchester oslo)
    (direct_flight oslo manchester)

    (current_day day_1)

    (oslo_count_0)
    (reykjavik_count_0)
    (manchester_count_0)
  )

  (:goal
    (and
      (assigned day_1)
      (assigned day_2)
      (assigned day_3)
      (assigned day_4)
      (assigned day_5)
      (assigned day_6)
      (assigned day_7)
      (assigned day_8)
      (current_day day_8)
      (wedding_satisfied)
      (oslo_count_6)
      (reykjavik_count_2)
      (manchester_count_2)
    )
  )
)