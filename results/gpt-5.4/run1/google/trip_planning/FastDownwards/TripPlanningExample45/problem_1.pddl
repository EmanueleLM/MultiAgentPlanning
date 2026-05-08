(define (problem trip_planning_example45_problem)
  (:domain trip_planning_example45)

  (:objects
    copenhagen lisbon florence - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8
    day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
  )

  (:init
    (direct_flight copenhagen lisbon)
    (direct_flight lisbon copenhagen)
    (direct_flight lisbon florence)
    (direct_flight florence lisbon)

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
    (next day_14 day_15)
    (next day_15 day_16)

    (today day_1)
    (at copenhagen)
    (visited_day_city day_1 copenhagen)
  )

  (:goal
    (and
      (today day_16)

      (visited_day_city day_1 copenhagen)
      (visited_day_city day_7 copenhagen)

      (visited_day_city day_2 copenhagen)
      (visited_day_city day_3 copenhagen)
      (visited_day_city day_4 copenhagen)
      (visited_day_city day_5 copenhagen)
      (visited_day_city day_6 lisbon)
      (visited_day_city day_8 lisbon)
      (visited_day_city day_9 lisbon)
      (visited_day_city day_10 lisbon)
      (visited_day_city day_11 lisbon)
      (visited_day_city day_12 florence)
      (visited_day_city day_13 florence)
      (visited_day_city day_14 florence)
      (visited_day_city day_15 florence)
      (visited_day_city day_16 copenhagen)
    )
  )
)