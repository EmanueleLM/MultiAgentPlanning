(define (problem trip_europe_8_days_instance_problem)
  (:domain trip_europe_8_days_instance)

  (:objects
    traveler_1 - traveler
    oslo reykjavik manchester - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 - day
  )

  (:init
    (next day_1 day_2)
    (next day_2 day_3)
    (next day_3 day_4)
    (next day_4 day_5)
    (next day_5 day_6)
    (next day_6 day_7)
    (next day_7 day_8)

    (flight oslo reykjavik)
    (flight reykjavik oslo)
    (flight oslo manchester)
    (flight manchester oslo)

    (current day_1)
    (wedding_day day_1)
    (wedding_day day_2)
  )

  (:goal
    (and
      (visited day_1)
      (visited day_2)
      (visited day_3)
      (visited day_4)
      (visited day_5)
      (visited day_6)
      (visited day_7)
      (visited day_8)
      (current day_8)

      (in_manchester day_1)
      (in_manchester day_2)

      (in_reykjavik day_7)
      (in_reykjavik day_8)

      (in_oslo day_1)
      (in_oslo day_2)
      (in_oslo day_3)
      (in_oslo day_4)
      (in_oslo day_5)
      (in_oslo day_6)
    )
  )
)