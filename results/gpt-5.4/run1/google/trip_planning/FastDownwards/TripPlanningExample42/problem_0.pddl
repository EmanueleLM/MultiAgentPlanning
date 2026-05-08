(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    paris nice mykonos - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    (before_start)

    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)

    (direct_flight paris nice)
    (direct_flight nice paris)
    (direct_flight nice mykonos)
    (direct_flight mykonos nice)

    (window_day d1)
    (window_day d2)
    (window_day d3)
    (window_day d4)

    (paris_count_0)
    (nice_count_0)
    (mykonos_count_0)
  )

  (:goal
    (and
      (current_day d11)
      (paris_count_4)
      (nice_count_5)
      (mykonos_count_4)
      (visited_window_paris)
      (at paris d11)
      (at nice d11)
      (at mykonos d11)
    )
  )
)