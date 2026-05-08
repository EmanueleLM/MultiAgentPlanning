(define (problem trip_planning_example43)
  (:domain trip_planning)
  (:objects
    venice porto dublin - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    c0 c1 c2 c3 c4 - count
  )
  (:init
    (at_start)
    (current_day d1)
    (is_venice venice)

    ;; Initial visit counts
    (visit_count venice c0)
    (visit_count porto c0)
    (visit_count dublin c0)

    ;; Day progression (10 days total, reaching d11 ends the trip)
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

    ;; Count progression (up to 4 days per city)
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)

    ;; Direct flights
    (flight dublin porto)
    (flight porto dublin)
    (flight venice dublin)
    (flight dublin venice)

    ;; Venice friend window (Day 1 to Day 4)
    (friend_window d1)
    (friend_window d2)
    (friend_window d3)
    (friend_window d4)
  )
  (:goal
    (and
      (visit_count venice c4)
      (visit_count porto c4)
      (visit_count dublin c4)
      (met_friends)
    )
  )
)