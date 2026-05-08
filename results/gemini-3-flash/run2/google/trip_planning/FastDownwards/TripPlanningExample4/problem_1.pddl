(define (problem trip_planning_example_4)
  (:domain trip_planning)
  (:objects
    seville munich tallinn - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  (:init
    (not_started)
    (current_day d1)
    
    ;; Sequential order of days for a 12-day trip (ending at the start of a dummy d13).
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)
    (next d11 d12)
    (next d12 d13)

    ;; Direct flight connections.
    (connected seville munich)
    (connected munich seville)
    (connected munich tallinn)
    (connected tallinn munich)
  )

  (:goal
    (and
      ;; Total trip duration requirement (12 days total).
      (current_day d13)

      ;; Seville visit: 7 days.
      ;; Given the 12-day limit and flight dependencies, Seville must be the first city.
      (visited seville d1)
      (visited seville d2)
      (visited seville d3)
      (visited seville d4)
      (visited seville d5)
      (visited seville d6)
      (visited seville d7)

      ;; Munich visit: 5 days.
      ;; Overlap with Seville occurs on the flight day (Day 7).
      (visited munich d7)
      (visited munich d8)
      (visited munich d9)
      (visited munich d10)
      (visited munich d11)

      ;; Tallinn visit: 2 days.
      ;; Overlap with Munich occurs on the flight day (Day 11).
      ;; Friend meeting constraint: Tallinn on Day 11 and Day 12.
      (visited tallinn d11)
      (visited tallinn d12)
    )
  )
)