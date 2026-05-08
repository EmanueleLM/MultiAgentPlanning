(define (problem meeting_planning_example_26)
  (:domain meeting_planning)
  (:objects
    richmond_district presidio - location
    t0900 t0907 t1315 t1330 t1345 t1400 t1415 t1430 t1445 t1500 t1515 - time
    s0 s1 s2 s3 s4 s5 s6 s7 - step
  )

  (:init
    (at richmond_district)
    (time_at t0900)
    (meeting_progress s0)

    ;; Time adjacency
    (next_time t0900 t0907)
    (next_time t0907 t1315)
    (next_time t1315 t1330)
    (next_time t1330 t1345)
    (next_time t1345 t1400)
    (next_time t1400 t1415)
    (next_time t1415 t1430)
    (next_time t1430 t1445)
    (next_time t1445 t1500)
    (next_time t1500 t1515)

    ;; Meeting step adjacency (7 steps of 15 min = 105 min)
    (next_step s0 s1)
    (next_step s1 s2)
    (next_step s2 s3)
    (next_step s3 s4)
    (next_step s4 s5)
    (next_step s5 s6)
    (next_step s6 s7)

    ;; Travel feasibility (7 minute trips)
    (travel_possible richmond_district presidio t0900 t0907)
    (travel_possible presidio richmond_district t0900 t0907)

    ;; Sarah's availability at Presidio (1:15PM to 3:15PM)
    (sarah_at presidio t1315)
    (sarah_at presidio t1330)
    (sarah_at presidio t1345)
    (sarah_at presidio t1400)
    (sarah_at presidio t1415)
    (sarah_at presidio t1430)
    (sarah_at presidio t1445)
    (sarah_at presidio t1500)
    (sarah_at presidio t1515)
  )

  (:goal
    (meeting_progress s7)
  )
)