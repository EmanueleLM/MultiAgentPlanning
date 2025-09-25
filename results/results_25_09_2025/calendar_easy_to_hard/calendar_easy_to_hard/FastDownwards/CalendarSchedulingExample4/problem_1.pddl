(define (problem schedule-meeting-monday)
  (:domain multi-agent-scheduling)
  (:objects
    donna john billy - agent
    t_0900 t_0930 t_1000 t_1030 t_1100 t_1130 t_1200 t_1230
    t_1300 t_1330 t_1400 t_1430 t_1500 t_1530 t_1600 t_1630 - time
  )
  (:init
    (free donna t_0900) (free donna t_0930) (free donna t_1000) (free donna t_1030)
    (free donna t_1100) (free donna t_1130) (free donna t_1200) (free donna t_1230)
    (free donna t_1300) (free donna t_1330)
    (free donna t_1430) (free donna t_1500)
    (free donna t_1600) (free donna t_1630)
    (free john t_0900) (free john t_0930) (free john t_1000) (free john t_1030)
    (free john t_1130) (free john t_1200) (free john t_1230)
    (free john t_1300) (free john t_1330) (free john t_1400) (free john t_1430)
    (free john t_1500) (free john t_1530) (free john t_1600)
    (free billy t_1000) (free billy t_1400)
  )
  (:goal (meeting-scheduled t_1000))
)