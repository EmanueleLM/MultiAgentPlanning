(define (problem trip_example_30)
  (:domain trip_planning)
  (:objects
    istanbul tallinn zurich - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 - count
  )
  (:init
    ;; Starting state: Traveler begins at Istanbul on Day 1.
    (at istanbul)
    (current_day d1)
    (stay_count istanbul c1)
    (stay_count tallinn c0)
    (stay_count zurich c0)
    (visited istanbul d1)

    ;; Temporal sequence for a 14-day trip (reaching the start of Day 15).
    (next_day d1 d2) (next_day d2 d3) (next_day d3 d4) (next_day d4 d5)
    (next_day d5 d6) (next_day d6 d7) (next_day d7 d8) (next_day d8 d9)
    (next_day d9 d10) (next_day d10 d11) (next_day d11 d12) (next_day d12 d13)
    (next_day d13 d14) (next_day d14 d15)

    ;; Successor relations for tracking stay durations.
    (next_count c0 c1) (next_count c1 c2) (next_count c2 c3) (next_count c3 c4)
    (next_count c4 c5) (next_count c5 c6) (next_count c6 c7) (next_count c7 c8)

    ;; Flight connectivity (bidirectional based on the specification).
    (conn istanbul tallinn) (conn tallinn istanbul)
    (conn istanbul zurich) (conn zurich istanbul)
    (conn tallinn zurich) (conn zurich tallinn)
  )
  (:goal
    (and
      ;; The trip must reach the target duration of 14 days.
      (current_day d15)
      
      ;; Specific stay requirements for the three cities.
      (stay_count istanbul c5)
      (stay_count tallinn c4)
      (stay_count zurich c7)

      ;; Show constraint: Traveler must be in Zurich from Day 1 to Day 7.
      (visited zurich d1)
      (visited zurich d2)
      (visited zurich d3)
      (visited zurich d4)
      (visited zurich d5)
      (visited zurich d6)
      (visited zurich d7)
    )
  )
)