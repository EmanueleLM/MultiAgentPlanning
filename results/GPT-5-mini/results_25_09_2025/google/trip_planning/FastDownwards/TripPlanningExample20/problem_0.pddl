(define (problem trip12)
  (:domain travel-integrated)
  (:objects
    istanbul budapest dubrovnik - city
  )

  (:init
    ; starting location (chosen so visiting all cities is possible with given direct flights)
    (at dubrovnik)

    ; direct flight connections (public / flight_checker information)
    (direct istanbul budapest)
    (direct budapest istanbul)
    (direct dubrovnik istanbul)

    ; numeric state initialization
    (= (days-used) 0)
    (= (days-in istanbul) 0)
    (= (days-in budapest) 0)
    (= (days-in dubrovnik) 0)

    ; traveler private "desired" values (used as per-city caps)
    (= (desired istanbul) 5)
    (= (desired budapest) 6)
    (= (desired dubrovnik) 3)

    ; overall total days constraint
    (= (total-days) 12)
  )

  ; Goal: a 12-day itinerary that visits the three cities and respects the available direct flights.
  ; To satisfy the global requirement (12 days total) while respecting the stated per-city caps,
  ; this problem requires allocation of days that sum to 12. One feasible allocation encoded as the goal:
  ;   Istanbul = 5 days (matches desired)
  ;   Dubrovnik = 3 days (matches desired)
  ;   Budapest = 4 days (<= desired 6)
  ; Total = 12 days.
  (:goal (and
           (= (days-in istanbul) 5)
           (= (days-in dubrovnik) 3)
           (= (days-in budapest) 4)
           (= (days-used) 12)
         )
  )
)