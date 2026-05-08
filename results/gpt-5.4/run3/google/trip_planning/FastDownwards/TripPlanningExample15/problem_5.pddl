(define (problem trip_planning_example15_instance)
  (:domain trip_planning_example15)

  (:objects
    berlin porto krakow - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
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

    (direct berlin porto)
    (direct porto berlin)
    (direct berlin krakow)
    (direct krakow berlin)
  )

  (:goal
    (and
      (current_day day_11)

      (visited berlin day_1)
      (visited berlin day_2)
      (visited berlin day_3)
      (visited berlin day_4)

      (visited krakow day_5)
      (visited krakow day_6)
      (visited krakow day_7)
      (visited krakow day_8)
      (visited krakow day_9)

      (visited porto day_10)
      (visited porto day_11)
    )
  )
)