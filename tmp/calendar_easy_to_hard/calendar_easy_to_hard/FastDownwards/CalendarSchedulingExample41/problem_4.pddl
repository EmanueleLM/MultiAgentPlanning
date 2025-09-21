(define (problem schedule-monday-meeting-integrated)
  (:domain integrated-meeting-scheduling)

  (:objects
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
    agent1 agent2 agent3 agent4 agent5 agent6 agent7 - person
  )

  (:init
    (free agent1 s0900) (free agent1 s1000) (free agent1 s1030) (free agent1 s1100)
    (free agent1 s1200) (free agent1 s1230) (free agent1 s1300) (free agent1 s1330)
    (free agent1 s1400) (free agent1 s1430) (free agent1 s1500) (free agent1 s1530)
    (free agent1 s1600) (free agent1 s1630)

    (free agent2 s0900) (free agent2 s0930) (free agent2 s1000) (free agent2 s1030)
    (free agent2 s1100) (free agent2 s1130) (free agent2 s1200) (free agent2 s1230)
    (free agent2 s1300) (free agent2 s1330) (free agent2 s1400) (free agent2 s1430)
    (free agent2 s1500) (free agent2 s1530) (free agent2 s1600) (free agent2 s1630)

    (free agent3 s0900) (free agent3 s0930) (free agent3 s1000) (free agent3 s1030)
    (free agent3 s1100) (free agent3 s1130) (free agent3 s1200) (free agent3 s1230)
    (free agent3 s1300) (free agent3 s1330) (free agent3 s1400) (free agent3 s1430)
    (free agent3 s1500) (free agent3 s1530) (free agent3 s1600) (free agent3 s1630)

    (free agent4 s0900) (free agent4 s0930) (free agent4 s1030) (free agent4 s1100)
    (free agent4 s1130) (free agent4 s1200) (free agent4 s1230) (free agent4 s1300)
    (free agent4 s1330) (free agent4 s1400) (free agent4 s1430) (free agent4 s1500)
    (free agent4 s1530) (free agent4 s1630)

    (free agent5 s0900) (free agent5 s0930) (free agent5 s1030) (free agent5 s1100)
    (free agent5 s1130) (free agent5 s1200) (free agent5 s1300) (free agent5 s1400)
    (free agent5 s1430) (free agent5 s1630)

    (free agent6 s1030) (free agent6 s1130) (free agent6 s1300) (free agent6 s1330)
    (free agent6 s1400) (free agent6 s1430)

    (free agent7 s1000) (free agent7 s1030) (free agent7 s1300) (free agent7 s1430)

    (preferred agent1 s0900) (preferred agent1 s1000) (preferred agent1 s1030)
    (preferred agent1 s1100) (preferred agent1 s1200) (preferred agent1 s1230) (preferred agent1 s1300)

    (preferred agent2 s0900) (preferred agent2 s0930) (preferred agent2 s1000) (preferred agent2 s1030)
    (preferred agent2 s1100) (preferred agent2 s1130) (preferred agent2 s1200) (preferred agent2 s1230)
    (preferred agent2 s1300) (preferred agent2 s1330)

    (preferred agent3 s0900) (preferred agent3 s0930) (preferred agent3 s1000) (preferred agent3 s1030)
    (preferred agent3 s1100) (preferred agent3 s1130) (preferred agent3 s1200) (preferred agent3 s1230)
    (preferred agent3 s1300) (preferred agent3 s1330)

    (preferred agent5 s0900) (preferred agent5 s0930) (preferred agent5 s1000) (preferred agent5 s1030)
    (preferred agent5 s1100) (preferred agent5 s1130) (preferred agent5 s1200) (preferred agent5 s1230)
    (preferred agent5 s1300) (preferred agent5 s1330)

    (preferred agent6 s1030) (preferred agent6 s1130) (preferred agent6 s1300) (preferred agent6 s1330)

    (preferred agent7 s1000) (preferred agent7 s1030) (preferred agent7 s1300)
  )

  (:goal (scheduled s1030))
)