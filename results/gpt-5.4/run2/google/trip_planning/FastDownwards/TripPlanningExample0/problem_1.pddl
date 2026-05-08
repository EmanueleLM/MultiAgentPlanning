(define (problem european_trip_14_days_instance)
  (:domain european_trip_14_days)

  (:objects
    barcelona florence helsinki start - location
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
    f0 f1 f2 f3 f4 f5 f6 - florence_count
    b0 b1 b2 b3 b4 b5 - barcelona_count
    h0 h1 h2 h3 h4 h5 - helsinki_count
  )

  (:init
    (at start)
    (current_day d1)

    (direct_flight barcelona florence)
    (direct_flight florence barcelona)
    (direct_flight helsinki barcelona)
    (direct_flight barcelona helsinki)

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
    (next_day d12 d13)
    (next_day d13 d14)
    (next_day d14 d15)

    (meeting_window_day d9)
    (meeting_window_day d10)
    (meeting_window_day d11)
    (meeting_window_day d12)
    (meeting_window_day d13)
    (meeting_window_day d14)

    (florence_days f0)
    (barcelona_days b0)
    (helsinki_days h0)

    (next_florence_count f0 f1)
    (next_florence_count f1 f2)
    (next_florence_count f2 f3)
    (next_florence_count f3 f4)
    (next_florence_count f4 f5)
    (next_florence_count f5 f6)

    (next_barcelona_count b0 b1)
    (next_barcelona_count b1 b2)
    (next_barcelona_count b2 b3)
    (next_barcelona_count b3 b4)
    (next_barcelona_count b4 b5)

    (next_helsinki_count h0 h1)
    (next_helsinki_count h1 h2)
    (next_helsinki_count h2 h3)
    (next_helsinki_count h3 h4)
    (next_helsinki_count h4 h5)
  )

  (:goal
    (and
      (visited_florence)
      (visited_barcelona)
      (visited_helsinki)
      (current_day d15)
      (florence_days f6)
      (barcelona_days b5)
      (helsinki_days h5)
      (meeting_done)
    )
  )
)