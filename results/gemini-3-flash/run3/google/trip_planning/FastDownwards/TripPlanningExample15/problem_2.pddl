(define (problem trip_planning_example15_problem)
  (:domain trip_planning_example15)
  (:objects
    berlin porto krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    v0 v1 v2 v3 v4 v5 v6 - val
  )
  (:init
    ;; Days sequence
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11)
    (is_last_day d11)

    ;; Values for counting (max needed is 6 for Berlin)
    (next_val v0 v1) (next_val v1 v2) (next_val v2 v3) (next_val v3 v4)
    (next_val v4 v5) (next_val v5 v6)

    ;; City counts start at zero
    (count berlin v0)
    (count porto v0)
    (count krakow v0)

    ;; Flight connections (bi-directional as per "Berlin and Porto, Krakow and Berlin")
    (connected berlin porto) (connected porto berlin)
    (connected krakow berlin) (connected berlin krakow)

    ;; Initial starting state: Start at Krakow on Day 1
    (at krakow)
    (current_day d1)
  )
  (:goal
    (and
      ;; Trip must be completed over 11 days
      (trip_done)

      ;; Specified stay durations
      (count berlin v6)
      (count porto v2)
      (count krakow v5)

      ;; Wedding requirement: Porto on days 10 and 11
      (visited porto d10)
      (visited porto d11)
    )
  )
)