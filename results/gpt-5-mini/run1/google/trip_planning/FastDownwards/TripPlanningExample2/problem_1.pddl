(define (problem TripPlanningExample2)
  (:domain trip_planning)
  (:objects
    reykjavik vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    ;; successor (consecutive day) relations
    (succ d1 d2) (succ d2 d3) (succ d3 d4) (succ d4 d5) (succ d5 d6)
    (succ d6 d7) (succ d7 d8) (succ d8 d9) (succ d9 d10) (succ d10 d11)

    ;; direct flight connections (only allowed direct flights)
    (flight reykjavik vienna) (flight vienna reykjavik)
    (flight vienna venice) (flight venice vienna)

    ;; initial occupancy: start in Reykjavik on day 1
    (at reykjavik d1)
    (occupied d1)
  )

  ;; Goals:
  ;; - assign a city for every day d1..d11 (occupied)
  ;; - be in Venice on days d8..d11 to guarantee attendance during the wedding window
  (:goal
    (and
      (occupied d1) (occupied d2) (occupied d3) (occupied d4) (occupied d5)
      (occupied d6) (occupied d7) (occupied d8) (occupied d9) (occupied d10) (occupied d11)
      (at venice d8) (at venice d9) (at venice d10) (at venice d11)
    )
  )
)