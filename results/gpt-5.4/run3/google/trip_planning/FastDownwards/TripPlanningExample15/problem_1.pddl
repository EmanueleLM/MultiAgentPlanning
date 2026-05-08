(define (problem trip_planning_example15_instance)
  (:domain trip_planning_example15)

  (:objects
    berlin porto krakow - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_10 day_11 - day
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
    (next_day day_8 day_10)
    (next_day day_10 day_11)

    (connected berlin porto)
    (connected porto berlin)
    (connected berlin krakow)
    (connected krakow berlin)

    (porto_wedding_window day_10)
    (porto_wedding_window day_11)
  )

  (:goal
    (and
      (current_day day_11)

      (visited_berlin day_1)
      (visited_berlin day_2)
      (visited_berlin day_3)
      (visited_berlin day_4)
      (visited_berlin day_5)
      (visited_berlin day_6)

      (visited_krakow day_7)
      (visited_krakow day_8)
      (visited_krakow day_9)
      (visited_krakow day_10)
      (visited_krakow day_11)

      (visited_porto day_10)
      (visited_porto day_11)
    )
  )
)