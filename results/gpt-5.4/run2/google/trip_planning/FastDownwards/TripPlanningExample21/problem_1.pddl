(define (problem tripplanningexample21_problem)
  (:domain tripplanningexample21)

  (:objects
    mykonos vienna venice - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 - day
  )

  (:init
    (at mykonos)
    (current_day day_1)

    (direct mykonos vienna)
    (direct vienna mykonos)
    (direct vienna venice)
    (direct venice vienna)

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

    (workshop_day day_5)
    (workshop_day day_6)
    (workshop_day day_7)
    (workshop_day day_8)
    (workshop_day day_9)
    (workshop_day day_10)
  )

  (:goal
    (and
      (current_day day_11)

      (visited_on mykonos day_1)
      (visited_on mykonos day_2)

      (visited_on vienna day_3)
      (visited_on vienna day_4)
      (visited_on vienna day_5)
      (visited_on vienna day_6)

      (visited_on venice day_5)
      (visited_on venice day_6)
      (visited_on venice day_7)
      (visited_on venice day_8)
      (visited_on venice day_9)
      (visited_on venice day_10)
    )
  )
)