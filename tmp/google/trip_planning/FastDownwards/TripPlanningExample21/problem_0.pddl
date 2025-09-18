(define (problem integrated-travel-problem)
  (:domain integrated-travel)
  (:objects
    traveler flight_agent - agent
    mykonos vienna venice - city
  )

  (:init
    ;; Initial elapsed days
    (= (day) 0)

    ;; Starting location for the traveling agent
    (at traveler mykonos)

    ;; Direct flight connectivity (no direct Mykonos<->Venice)
    (direct mykonos vienna)
    (direct vienna mykonos)

    (direct vienna venice)
    (direct venice vienna)
  )

  ;; Goals: visit all cities, attend workshop in Venice, and total elapsed days == 10
  (:goal
    (and
      (visited mykonos)
      (visited vienna)
      (visited venice)
      (workshop-attended)
      (= (day) 10)
    )
  )
)