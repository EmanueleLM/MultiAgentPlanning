(define (problem meet_george_in_san_francisco)
  (:domain san_francisco_visit)
  (:objects
    north_beach haight_ashbury - location
    george planner - person
    t0 t1 t2 t3 t4 t5 t6 t7 - time ; Represents steps of 30-min increments starting from 9:00 AM
  )
  (:init
    (at planner north_beach)
    (at george haight_ashbury)
    (current_time t0)
    (can_meet)
    (next t0 t1) ; 9:00 to 9:30
    (next t1 t2) ; 9:30 to 10:00
    (next t2 t3) ; 10:00 to 10:30
    (next t3 t4) ; 10:30 to 11:00
    (next t4 t5) ; 11:00 to 11:30
    (next t5 t6) ; 11:30 to 12:00
    (next t6 t7) ; 12:00 to 12:30
  )
  (:goal (and (met george)))
)