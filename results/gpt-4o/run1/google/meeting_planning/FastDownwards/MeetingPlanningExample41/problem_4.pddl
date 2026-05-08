(define (problem meet_friends_in_san_francisco)
  (:domain san_francisco_visit)
  (:objects
    north_beach haight_ashbury - location
    george planner - person
    t0 t1 t2 t3 t4 t5 t6 t7 - time ; Represents 9:00 AM to 1:30 PM in 30-minute increments
  )
  (:init
    (at planner north_beach)
    (at george haight_ashbury)
    (current_time t0)
    (available george t1)
    (available george t2)
    (available george t3)
    (available george t4)
    (available george t5)
    (next_time t0 t1)
    (next_time t1 t2)
    (next_time t2 t3)
    (next_time t3 t4)
    (next_time t4 t5)
    (next_time t5 t6)
    (next_time t6 t7)
    (can_meet george)
  )
  (:goal (and (met george)))
)