(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    krakow athens zurich - city
  )
  (:init
    ; Initial location - Zurich is chosen as a central point for starting.
    (at zurich)

    ; Direct flight connections: Zurich <-> Krakow, Athens <-> Zurich.
    (connected zurich krakow)
    (connected krakow zurich)
    (connected athens zurich)
    (connected zurich athens)

    ; Initialize stay durations for each city
    (= (krakow-stay-days) 0)
    (= (athens-stay-days) 0)
    (= (zurich-stay-days) 0)

    ; Initialize day counter for the trip, starting from Day 1
    (= (current-day) 1)

    ; Initialize total trip cost (number of days)
    (= (total-trip-cost) 0)
  )
  (:goal (and
    ; Fulfill all specified stay durations
    (>= (krakow-stay-days) 6)
    (>= (athens-stay-days) 7)
    (>= (zurich-stay-days) 5)
  ))
  ; Minimize the total number of days for the trip
  (:metric minimize (total-trip-cost))
)