(define (problem meeting_planning_example11-problem)
  (:domain meeting_planning_example11)

  (:objects
    nobhill sunset - location
    t0900 t1335 t1400 t1515 t2030 - timepoint
  )

  (:init
    (at nobhill t0900)
    (at nobhill t1335)

    (carol_present t1400)
    (carol_present t1515)
    (carol_present t2030)

    (travel_leg nobhill sunset t1335 t1400)
    (meet_window sunset t1400 t1515)
  )

  (:goal (met_carol))
)