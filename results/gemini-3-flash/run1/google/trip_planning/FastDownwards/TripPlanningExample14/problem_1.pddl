(define (problem trip_example)
  (:domain trip_planning)
  (:objects
    lyon frankfurt krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - visit_step
  )
  (:init
    ;; Starting point for the 10-day trip.
    (at lyon d1)

    ;; Initial visit counts for all cities.
    (visit_count lyon s0)
    (visit_count frankfurt s0)
    (visit_count krakow s0)

    ;; Direct flight network as specified.
    (flight lyon frankfurt)
    (flight frankfurt lyon)
    (flight frankfurt krakow)
    (flight krakow frankfurt)

    ;; Temporal ordering of days (10 days total, d11 represents the end of the trip).
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

    ;; Ordering of symbolic count steps.
    (next_step s0 s1)
    (next_step s1 s2)
    (next_step s2 s3)
    (next_step s3 s4)
    (next_step s4 s5)
    (next_step s5 s6)
    (next_step s6 s7)
    (next_step s7 s8)
    (next_step s8 s9)
    (next_step s9 s10)
  )
  (:goal
    (and
      ;; Total 10 days: Lyon 7 days, Krakow 3 days, Frankfurt 2 days.
      (visit_count lyon s7)
      (visit_count krakow s3)
      (visit_count frankfurt s2)
      
      ;; Specific constraint: attend annual show in Krakow from Day 8 to Day 10.
      (visited krakow d8)
      (visited krakow d9)
      (visited krakow d10)
      
      ;; Ensure the trip duration is fully accounted for.
      (at krakow d11)
    )
  )
)