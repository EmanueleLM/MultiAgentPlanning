(define (problem trip_planning_example45_problem)
  (:domain trip_planning_example45)

  (:objects
    copenhagen lisbon florence - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8
    day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day
  )

  (:init
    (at copenhagen)
    (visited copenhagen)
    (current day_1)

    (direct copenhagen lisbon)
    (direct lisbon copenhagen)
    (direct lisbon florence)
    (direct florence lisbon)

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

    (in copenhagen day_1)
    (in copenhagen day_7)
    (in copenhagen day_8)
    (in copenhagen day_9)
    (in copenhagen day_10)
    (in copenhagen day_11)
    (in copenhagen day_12)

    (in lisbon day_2)
    (in lisbon day_3)
    (in lisbon day_4)
    (in lisbon day_5)
    (in lisbon day_6)
    (in lisbon day_13)
    (in lisbon day_14)

    (in florence day_15)
    (in florence day_16)
    (in florence day_3)
    (in florence day_4)
  )

  (:goal
    (and
      (current day_16)
      (at florence)
      (visited copenhagen)
      (visited lisbon)
      (visited florence)
    )
  )
)