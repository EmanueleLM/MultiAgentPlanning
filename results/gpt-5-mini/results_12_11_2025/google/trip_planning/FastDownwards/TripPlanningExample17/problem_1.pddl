(define (problem TripPlanningExample17-problem)
  (:domain TripPlanningExample17-domain)
  (:objects
    copenhagen vienna lyon - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )
  (:init
    ;; start
    (current d1)
    (at copenhagen)
    (visited copenhagen)

    ;; conference days
    (conf_day d1)
    (conf_day d5)

    ;; ready is true for all non-conference days (attend_conf will set ready for conf days)
    (ready d2) (ready d3) (ready d4)
    (ready d6) (ready d7) (ready d8) (ready d9) (ready d10) (ready d11)

    ;; direct flight connectivity (directed edges)
    (direct copenhagen vienna)
    (direct vienna copenhagen)
    (direct vienna lyon)
    (direct lyon vienna)

    ;; linear day chain
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
  )

  ;; Goal requires reaching the final day and having visited all three cities
  (:goal (and
    (current d11)
    (visited copenhagen)
    (visited vienna)
    (visited lyon)
  ))
)