(define (problem TripPlanningExample30)
  (:domain trip-planning)
  (:objects
    istanbul tallinn zurich - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
  )
  (:init
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6) (next d6 d7)
    (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13) (next d13 d14)
    (direct istanbul tallinn) (direct tallinn istanbul)
    (direct istanbul zurich) (direct zurich istanbul)
    (direct zurich tallinn) (direct tallinn zurich)
    (at zurich d1)
  )
  (:goal (and
    ; Zurich show requirement: be in Zurich for days 1-7
    (at zurich d1) (at zurich d2) (at zurich d3) (at zurich d4) (at zurich d5) (at zurich d6) (at zurich d7)
    ; Traveler stay requirements (as stated): Istanbul 5 days, Tallinn 4 days
    ; Istanbul days 8-12 (5 days)
    (at istanbul d8) (at istanbul d9) (at istanbul d10) (at istanbul d11) (at istanbul d12)
    ; Tallinn 4 days (here encoded as days 11-14, overlapping with Istanbul to reflect the conflicting human constraints)
    (at tallinn d11) (at tallinn d12) (at tallinn d13) (at tallinn d14)
  ))
)