(define (problem trip_planning_example17_problem)
  (:domain trip_planning_example17)

  (:objects
    copenhagen vienna lyon - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
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
    (next_day day_10 day_11)

    (direct_flight copenhagen vienna)
    (direct_flight vienna copenhagen)
    (direct_flight vienna lyon)
    (direct_flight lyon vienna)

    (current_day day_1)
    (at copenhagen)
    (visited_on day_1 copenhagen)
  )

  (:goal
    (and
      (visited_on day_5 copenhagen)

      (visited_on day_2 copenhagen)
      (visited_on day_3 copenhagen)
      (visited_on day_4 copenhagen)

      (visited_on day_6 vienna)
      (visited_on day_7 vienna)
      (visited_on day_8 vienna)
      (visited_on day_9 lyon)

      (visited_on day_10 lyon)
      (visited_on day_11 lyon)
    )
  )
)