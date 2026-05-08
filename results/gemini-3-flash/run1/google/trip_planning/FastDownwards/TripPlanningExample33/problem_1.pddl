(define (problem trip_example_33)
  (:domain trip_planning)
  (:objects
    rome barcelona krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )
  (:init
    ;; Starting position and time
    (at rome)
    (current_day d1)
    (last_day d13)

    ;; Initial visit counts for all cities
    (city_count rome c0)
    (city_count barcelona c0)
    (city_count krakow c0)

    ;; Day sequence (13 days total)
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

    ;; Count sequence for stay durations
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)

    ;; Direct flight connections
    (flight barcelona krakow)
    (flight krakow barcelona)
    (flight rome barcelona)
    (flight barcelona rome)
  )
  (:goal (and
    ;; Trip must be completed over the 13 days
    (trip_complete)

    ;; Stay duration requirements
    ;; Rome: 4 days
    (city_count rome c4)
    ;; Barcelona: 7 days
    (city_count barcelona c7)
    ;; Krakow: 4 days
    (city_count krakow c4)

    ;; Friend meeting window in Krakow (Days 10-13)
    (visited krakow d10)
    (visited krakow d11)
    (visited krakow d12)
    (visited krakow d13)
  ))
)