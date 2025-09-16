(define (problem meeting-problem)
  (:domain meeting-orchestrator)
  (:objects
    p1 p2 p3 p4 - person
    t_0900 t_0930 t_1000 t_1030 t_1100 t_1130 t_1200 t_1230 t_1300 t_1330 t_1400 t_1430 t_1500 t_1530 t_1600 t_1630 - time
  )
  (:init
    (busy p1 t_1000)
    (busy p2 t_1300)
    (busy p3 t_1430)
    (busy p4 t_1600)
  )
  (:goal (or
    (meeting_at t_0900)
    (meeting_at t_1130)
    (meeting_at t_1200)
    (meeting_at t_1500)))
)