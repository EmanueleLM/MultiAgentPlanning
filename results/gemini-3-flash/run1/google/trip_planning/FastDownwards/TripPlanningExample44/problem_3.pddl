(define (problem trip_planning_example_44)
  (:domain trip_planning)
  (:objects
    lyon zurich rome - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 d17 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )
  (:init
    ;; Starting conditions: Day 1 in Zurich
    (current_city zurich)
    (current_day d1)
    (at zurich d1)
    (visited_count zurich c1)
    (visited_count rome c0)
    (visited_count lyon c0)

    ;; Successor relations for days (Total trip duration: 17 days)
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
    (next_day d15 d16)
    (next_day d16 d17)

    ;; Successor relations for visit counts
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)

    ;; Flight network: direct flights provided
    (flight rome lyon)
    (flight lyon rome)
    (flight zurich rome)
    (flight rome zurich)
  )
  (:goal (and
    ;; Requirements: Visit durations for each city
    (visited_count zurich c7)
    (visited_count rome c6)
    (visited_count lyon c6)

    ;; Temporal constraint: Wedding in Zurich from Day 1 to Day 7
    (at zurich d1)
    (at zurich d2)
    (at zurich d3)
    (at zurich d4)
    (at zurich d5)
    (at zurich d6)
    (at zurich d7)

    ;; The trip must conclude on Day 17
    (current_day d17)
  ))
)