(define (problem trip_planning_38_problem)
  (:domain trip_planning_example_38)
  (:objects
    geneva madrid venice - city
    d1 d2 d3 d4 d5 d6 - day
  )
  (:init
    (not_started)
    (current_day d1)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (can_fly geneva madrid)
    (can_fly madrid geneva)
    (can_fly madrid venice)
    (can_fly venice madrid)
  )
  (:goal
    (and
      (current_day d6)
      ;; Conference in Venice on Day 4 and Day 5
      (visited venice d4)
      (visited venice d5)
      ;; 2 Days in Venice (covered by d4, d5)
      (exists (?da ?db - day)
        (and (not (= ?da ?db))
             (visited venice ?da)
             (visited venice ?db)))
      ;; 2 Days in Geneva
      (exists (?dg1 ?dg2 - day)
        (and (not (= ?dg1 ?dg2))
             (visited geneva ?dg1)
             (visited geneva ?dg2)))
      ;; 3 Days in Madrid
      (exists (?dm1 ?dm2 ?dm3 - day)
        (and (not (= ?dm1 ?dm2))
             (not (= ?dm1 ?dm3))
             (not (= ?dm2 ?dm3))
             (visited madrid ?dm1)
             (visited madrid ?dm2)
             (visited madrid ?dm3)))
    )
  )
)