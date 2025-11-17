(define (problem MeetingPlanningExample6)
  (:domain sf_one_day_meetings)
  (:objects
    fw nh - location
    t0900 t1404 t1415 t1945 - time
    kenneth - person
  )
  (:init
    ; initial time and location
    (now t0900)
    (at fw)

    ; Kenneth's location and availability window
    (kenneth-at nh)
    (avail-start t1415)
    (avail-end t1945)

    ; travel graph and time reachability
    (connected11 fw nh)
    (connected11 nh fw)
    (reach304 t0900 t1404)
    (reach11 t1404 t1415)

    (= (total-cost) 0)
  )
  (:goal
    (and
      (met-kenneth)
      (now t1945)
    )
  )
  (:metric minimize (total-cost))
)