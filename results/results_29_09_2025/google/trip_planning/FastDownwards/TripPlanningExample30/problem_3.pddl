(define (problem TripPlanningExample30)
  (:domain trip-planning)
  (:objects
    istanbul tallinn zurich - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
  )
  (:init
    ; timeline
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6) (next d6 d7)
    (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13) (next d13 d14)
    ; direct flights (bidirectional as given)
    (direct istanbul tallinn) (direct tallinn istanbul)
    (direct istanbul zurich) (direct zurich istanbul)
    (direct zurich tallinn) (direct tallinn zurich)
    ; city identity predicates for conditional effects
    (is-istanbul istanbul) (is-tallinn tallinn) (is-zurich zurich)
    ; initial location: must be in Zurich on day 1 because show runs day1-7
    (at zurich d1)
    ; initial numeric counters: day 1 is already Zurich
    (= (days-istanbul) 0)
    (= (days-tallinn) 0)
    (= (days-zurich) 1)
    (= (total-days) 1)
    (= (total-cost) 0)
  )
  (:goal (and
    ; enforce requested stays
    (= (days-istanbul) 5)
    (= (days-tallinn) 4)
    (= (days-zurich) 7)
    ; enforce total length 14 days
    (= (total-days) 14)
    ; enforce being in Zurich during the show (days 1-7)
    (at zurich d1) (at zurich d2) (at zurich d3) (at zurich d4) (at zurich d5) (at zurich d6) (at zurich d7)
  ))
)