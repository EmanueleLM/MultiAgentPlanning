(define (problem trip_planning_example_20)
  (:domain trip_planning)
  (:objects
    istanbul budapest dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 - count
  )
  (:init
    ;; Starting conditions:
    ;; Since there are no flights into Dubrovnik, the traveler must start there.
    (at dubrovnik)
    (current_day d1)
    
    ;; Initial visit counts:
    (visited_count istanbul c0)
    (visited_count budapest c0)
    (visited_count dubrovnik c0)
    
    ;; Implicitly, at least 0 days are visited.
    (visited_at_least istanbul c0)
    (visited_at_least budapest c0)
    (visited_at_least dubrovnik c0)

    ;; Temporal adjacency:
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

    ;; Count succession:
    (next_count c0 c1)
    (next_count c1 c2)
    (next_count c2 c3)
    (next_count c3 c4)
    (next_count c4 c5)
    (next_count c5 c6)
    (next_count c6 c7)
    (next_count c7 c8)
    (next_count c8 c9)
    (next_count c9 c10)
    (next_count c10 c11)
    (next_count c11 c12)

    ;; Flight connectivity:
    ;; Istanbul and Budapest have bidirectional flights.
    (flight istanbul budapest)
    (flight budapest istanbul)
    ;; Flight from Dubrovnik to Istanbul is one-way.
    (flight dubrovnik istanbul)
  )
  (:goal
    (and
      ;; Total trip duration of 12 days (completed after 12 day-actions).
      (current_day d13)
      ;; Visit requirements:
      (visited_at_least dubrovnik c3)
      (visited_at_least istanbul c5)
      (visited_at_least budapest c6)
    )
  )
)