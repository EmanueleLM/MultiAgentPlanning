(define (problem trip_planning_example44_problem)
  (:domain trip_planning_example44)

  (:objects
    rome lyon zurich - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9
    day_10 day_11 day_12 day_13 day_14 day_15 day_16 day_17 day_18 - day
  )

  (:init
    (at rome)
    (current_day day_1)

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
    (next day_16 day_17)
    (next day_17 day_18)

    (direct rome lyon)
    (direct lyon rome)
    (direct rome zurich)
    (direct zurich rome)

    (wedding_day day_1)
    (wedding_day day_2)
    (wedding_day day_3)
    (wedding_day day_4)
    (wedding_day day_5)
    (wedding_day day_6)
    (wedding_day day_7)
  )

  (:goal
    (and
      (current_day day_18)
      (wedding_attended)

      (in_city_on rome day_1)
      (in_city_on rome day_2)
      (in_city_on rome day_3)
      (in_city_on rome day_4)
      (in_city_on rome day_5)
      (in_city_on rome day_6)

      (in_city_on zurich day_7)
      (in_city_on zurich day_8)
      (in_city_on zurich day_9)
      (in_city_on zurich day_10)
      (in_city_on zurich day_11)
      (in_city_on zurich day_12)
      (in_city_on zurich day_13)

      (in_city_on lyon day_14)
      (in_city_on lyon day_15)
      (in_city_on lyon day_16)
      (in_city_on lyon day_17)
      (in_city_on lyon day_6)
      (in_city_on lyon day_7)
    )
  )
)