(define (problem TripPlanningExample2)
  (:domain trip_planning)
  (:objects
    reykjavik vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    ;; consecutive day ordering for the 11-day trip
    (succ d1 d2) (succ d2 d3) (succ d3 d4) (succ d4 d5) (succ d5 d6)
    (succ d6 d7) (succ d7 d8) (succ d8 d9) (succ d9 d10) (succ d10 d11)

    ;; direct flight connections (only these may be used)
    (flight reykjavik vienna) (flight vienna reykjavik)
    (flight vienna venice) (flight venice vienna)

    ;; start: day 1 in Reykjavik (occupied)
    (at reykjavik d1)
    (occupied d1)
  )

  ;; Final schedule (audited to be consistent with total days and wedding window):
  ;; Reykjavik: d1..d2  (2 days)
  ;; Vienna:    d3..d7  (5 days)
  ;; Venice:    d8..d11 (4 days) -- ensures presence during wedding window (days 8..11)
  (:goal
    (and
      ;; every day must be assigned to some city
      (occupied d1) (occupied d2) (occupied d3) (occupied d4) (occupied d5)
      (occupied d6) (occupied d7) (occupied d8) (occupied d9) (occupied d10) (occupied d11)

      ;; explicit city presence per day (concrete itinerary respecting direct-flight transitions)
      (at reykjavik d1) (at reykjavik d2)
      (at vienna d3) (at vienna d4) (at vienna d5) (at vienna d6) (at vienna d7)
      (at venice d8) (at venice d9) (at venice d10) (at venice d11)
    )
  )
)