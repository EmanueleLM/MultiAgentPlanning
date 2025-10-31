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
    (total-days-14)
    (req-istanbul-5)
    (req-tallinn-4)
    (req-zurich-7)
    (start-day-1)
    (at zurich d1)
    (= (total-cost) 0)
  )
  (:goal (and
    (total-days-14)
    (req-istanbul-5)
    (req-tallinn-4)
    (req-zurich-7)
    (at zurich d1) (at zurich d2) (at zurich d3) (at zurich d4) (at zurich d5) (at zurich d6) (at zurich d7)
  ))
  (:metric minimize (total-cost))
)