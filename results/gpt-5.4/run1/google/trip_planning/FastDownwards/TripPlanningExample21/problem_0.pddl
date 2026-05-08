(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    mykonos vienna venice - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (current_day d0)

    (next_day d0 d1)
    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)

    (direct_flight mykonos vienna)
    (direct_flight vienna mykonos)
    (direct_flight vienna venice)
    (direct_flight venice vienna)

    (mykonos_count_0)
    (vienna_count_0)
    (venice_count_0)
  )

  (:goal
    (and
      (current_day d10)
      (mykonos_count_2)
      (vienna_count_4)
      (venice_count_6)
      (workshop_attended)
    )
  )
)