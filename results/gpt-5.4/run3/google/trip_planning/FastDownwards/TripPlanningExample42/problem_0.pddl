(define (problem european_trip_11_days_instance_problem)
  (:domain european_trip_11_days_instance)

  (:objects
    paris nice mykonos - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day

    p0 p1 p2 p3 p4 - paris_count
    n0 n1 n2 n3 n4 n5 - nice_count
    m0 m1 m2 m3 m4 - mykonos_count
  )

  (:init
    (at paris)

    (current_day d1)

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
    (next_day d11 d12)

    (direct_flight paris nice)
    (direct_flight nice paris)
    (direct_flight nice mykonos)
    (direct_flight mykonos nice)

    (paris_days p0)
    (next_paris_count p0 p1)
    (next_paris_count p1 p2)
    (next_paris_count p2 p3)
    (next_paris_count p3 p4)

    (nice_days n0)
    (next_nice_count n0 n1)
    (next_nice_count n1 n2)
    (next_nice_count n2 n3)
    (next_nice_count n3 n4)
    (next_nice_count n4 n5)

    (mykonos_days m0)
    (next_mykonos_count m0 m1)
    (next_mykonos_count m1 m2)
    (next_mykonos_count m2 m3)
    (next_mykonos_count m3 m4)

    (meeting_window_day d1)
    (meeting_window_day d2)
    (meeting_window_day d3)
    (meeting_window_day d4)
  )

  (:goal
    (and
      (current_day d12)
      (paris_days p4)
      (nice_days n5)
      (mykonos_days m4)
      (meeting_done)
    )
  )
)