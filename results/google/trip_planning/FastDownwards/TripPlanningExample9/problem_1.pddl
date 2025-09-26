(define (problem TripPlanningExample9-problem)
  (:domain TripPlanningExample9)

  (:objects
    bucharest frankfurt stuttgart
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10
  )

  (:init
    ; initial location: start in Bucharest on day 1
    (at bucharest d1)

    ; direct flights (only allowed direct commutes)
    (flight bucharest frankfurt)
    (flight frankfurt bucharest)
    (flight frankfurt stuttgart)
    (flight stuttgart frankfurt)

    ; day succession (total_days = 10)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
  )

  ; Reconciled allocation of the 10-day trip that satisfies the Stuttgart workshop constraint:
  ; - Bucharest: 2 days (d1,d2)
  ; - Frankfurt: 2 days (d3,d4)
  ; - Stuttgart: 6 days (d5..d10) which includes the workshop window (day5..day10)
  (:goal (and
    (at bucharest d1)
    (at bucharest d2)
    (at frankfurt d3)
    (at frankfurt d4)
    (at stuttgart d5)
    (at stuttgart d6)
    (at stuttgart d7)
    (at stuttgart d8)
    (at stuttgart d9)
    (at stuttgart d10)
  ))
)