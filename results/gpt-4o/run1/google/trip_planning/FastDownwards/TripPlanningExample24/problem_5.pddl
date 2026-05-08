(define (problem trip_planning_instance)
  (:domain trip_planning)

  (:objects
    florence amsterdam riga - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7
    day_8 day_9 day_10 day_11 day_12 day_13 - day
  )

  (:init
    (next_day day_1 day_2) (next_day day_2 day_3) (next_day day_3 day_4)
    (next_day day_4 day_5) (next_day day_5 day_6) (next_day day_6 day_7)
    (next_day day_7 day_8) (next_day day_8 day_9) (next_day day_9 day_10)
    (next_day day_10 day_11) (next_day day_11 day_12) (next_day day_12 day_13)

    (flight_available florence amsterdam)
    (flight_available amsterdam riga)

    (at florence day_1)
  )

  (:goal
    (and
      (workshop_done)
      (at riga day_13)
      (visited florence)
      (visited amsterdam)
      (visited riga)
    )
  )
)