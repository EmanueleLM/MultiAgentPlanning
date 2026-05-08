(define (problem tripplanningexample21)
  (:domain european_trip_10_days)

  (:objects
    mykonos vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (current_day d1)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    (direct mykonos vienna)
    (direct vienna mykonos)
    (direct vienna venice)
    (direct venice vienna)

    (in_venice_window d5)
    (in_venice_window d6)
    (in_venice_window d7)
    (in_venice_window d8)
    (in_venice_window d9)
    (in_venice_window d10)
  )

  (:goal
    (and
      (finished)
      (workshop_attended)

      (visited_on mykonos d1)
      (visited_on mykonos d2)

      (visited_on vienna d3)
      (visited_on vienna d4)
      (visited_on vienna d5)
      (visited_on vienna d6)

      (visited_on venice d5)
      (visited_on venice d6)
      (visited_on venice d7)
      (visited_on venice d8)
      (visited_on venice d9)
      (visited_on venice d10)
    )
  )
)