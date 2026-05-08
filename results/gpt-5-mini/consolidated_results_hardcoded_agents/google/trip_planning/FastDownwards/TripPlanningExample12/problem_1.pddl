(define (problem TripPlanningExample12-problem)
  (:domain trip_planning)
  (:objects
    valencia amsterdam tallinn - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 - day
  )
  (:init
    ;; all days initially free
    (free d1) (free d2) (free d3) (free d4) (free d5)
    (free d6) (free d7) (free d8) (free d9) (free d10)
    (free d11) (free d12) (free d13) (free d14) (free d15)

    ;; first day marker
    (first-day d1)

    ;; consecutive day relation
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    (next d11 d12) (next d12 d13) (next d13 d14) (next d14 d15)

    ;; direct flights (only allowed commutes)
    (flight valencia amsterdam)
    (flight amsterdam valencia)
    (flight amsterdam tallinn)
    (flight tallinn amsterdam)

    ;; meeting window days for Tallinn (day 9..15 inclusive)
    (day-in-meeting-window d9) (day-in-meeting-window d10) (day-in-meeting-window d11)
    (day-in-meeting-window d12) (day-in-meeting-window d13) (day-in-meeting-window d14)
    (day-in-meeting-window d15)

    ;; identify Tallinn city
    (is-tallinn tallinn)
  )
  (:goal
    (and
      (visited valencia)
      (visited amsterdam)
      (visited tallinn)
      (tallinn_meet)
    )
  )
)