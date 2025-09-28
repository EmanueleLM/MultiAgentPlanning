(define (problem trip_problem)
  (:domain trip_domain)
  (:objects
    prague vienna porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    ; initial location: start in Prague on day1
    (at prague d1)

    ; day order
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)

    ; direct flights (only allowed direct connections)
    (direct_flight prague vienna)
    (direct_flight vienna prague)
    (direct_flight vienna porto)
    (direct_flight porto vienna)

    ; workshop not attended initially (no predicate for it)
  )

  (:goal
    (and
      ; Prague: days 1-3
      (at prague d1)
      (at prague d2)
      (at prague d3)

      ; Vienna: day 4
      (at vienna d4)

      ; Porto: days 5-9
      (at porto d5)
      (at porto d6)
      (at porto d7)
      (at porto d8)
      (at porto d9)

      ; Workshop must be attended between day1 and day3 (one of those attend actions must be applied)
      (workshop-attended)
    )
  )
)