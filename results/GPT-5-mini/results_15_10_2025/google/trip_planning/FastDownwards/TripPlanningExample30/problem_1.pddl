(define (problem TripPlanningExample30)
  (:domain tripplanning)
  (:objects
    istanbul tallinn zurich - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
    n4 n5 n7 n14 - num
  )
  (:init
    ;; day ordering
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13)
    (next d13 d14)
    (start-day d1)

    ;; direct flights (both directions)
    (direct istanbul tallinn) (direct tallinn istanbul)
    (direct istanbul zurich) (direct zurich istanbul)
    (direct zurich tallinn) (direct tallinn zurich)

    ;; traveler stay requirements (encoded as facts to preserve constraints)
    (stay-required istanbul n5)
    (stay-required tallinn n4)
    (stay-required zurich n7)
    (total-days n14)

    ;; Zurich show window (day range)
    (show-window zurich d1 d7)
  )
  (:goal (start-day d1))
)