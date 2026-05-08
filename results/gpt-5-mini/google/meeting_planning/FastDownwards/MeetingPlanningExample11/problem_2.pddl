(define (problem meeting_planning_example11-problem)
  (:domain meeting_planning_example11)

  (:objects
    nobhill sunset - location
    t0900 t1335 t1400 t1515 t2030 - timepoint
  )

  (:init
    ;; traveler starts at nobhill at 09:00
    (at nobhill t0900)

    ;; ensure traveler is at nobhill at chosen departure time so travel action is applicable
    (at nobhill t1335)

    ;; carol availability sampled at interval endpoints:
    ;; carol is present at 14:00, at 15:15 (end of 75-min meeting), and at 20:30 (window end)
    (carol_present t1400)
    (carol_present t1515)
    (carol_present t2030)
  )

  ;; Goal: enforce that the traveller meets Carol for the required continuous 75-minute interval.
  (:goal (met_carol))
)