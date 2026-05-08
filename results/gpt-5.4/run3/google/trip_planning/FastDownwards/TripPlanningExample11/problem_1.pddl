(define (problem tripplanningexample11)
  (:domain european_trip_15_days_instance)

  (:objects
    vienna vilnius valencia - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 - day
  )

  (:init
    (direct_flight vienna valencia)
    (direct_flight valencia vienna)
    (direct_flight vilnius vienna)
    (direct_flight vienna vilnius)

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
    (next_day day_11 day_12)
    (next_day day_12 day_13)
    (next_day day_13 day_14)
    (next_day day_14 day_15)

    (current_day day_1)
    (at vienna)

    (conference_day day_9 valencia)
    (conference_day day_15 valencia)
  )

  (:goal
    (and
      (visited_on vienna day_1)
      (visited_on vienna day_2)
      (visited_on vienna day_3)
      (visited_on vienna day_4)
      (visited_on vienna day_5)

      (visited_on vilnius day_6)
      (visited_on vilnius day_7)
      (visited_on vilnius day_8)
      (visited_on vilnius day_9)
      (visited_on vilnius day_10)

      (visited_on valencia day_9)
      (visited_on valencia day_10)
      (visited_on valencia day_11)
      (visited_on valencia day_12)
      (visited_on valencia day_13)
      (visited_on valencia day_14)
      (visited_on valencia day_15)
    )
  )
)