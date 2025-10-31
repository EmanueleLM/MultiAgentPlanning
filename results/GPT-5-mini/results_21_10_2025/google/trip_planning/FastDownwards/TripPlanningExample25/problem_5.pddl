(define (problem TripPlanningExample25-problem)
  (:domain trip-planning)

  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    ;; day sequence
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13)
    (next d13 d14) (next d14 d15) (next d15 d16)

    ;; direct flights (only allowed direct connections)
    (flight valencia lyon) (flight lyon valencia)
    (flight lyon split) (flight split lyon)

    ;; starting location: day 1 in Valencia
    (assigned d1 valencia)
  )

  (:goal
    (and
      ;; Valencia days 1-5
      (assigned d1 valencia) (assigned d2 valencia) (assigned d3 valencia)
      (assigned d4 valencia) (assigned d5 valencia)

      ;; Lyon days 6-9 (adjusted to fit 16-day horizon)
      (assigned d6 lyon) (assigned d7 lyon) (assigned d8 lyon) (assigned d9 lyon)

      ;; Split mandatory attendance days 10-16
      (assigned d10 split) (assigned d11 split) (assigned d12 split)
      (assigned d13 split) (assigned d14 split) (assigned d15 split) (assigned d16 split)
    )
  )
)