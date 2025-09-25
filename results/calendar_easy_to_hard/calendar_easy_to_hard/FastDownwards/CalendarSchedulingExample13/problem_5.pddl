(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling-multiagent)
  (:objects
    gerald roy barbara - agent
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    (= (total-cost) 0)

    (free gerald t0930)
    (free gerald t1000)
    (free gerald t1030)
    (free gerald t1100)
    (free gerald t1130)
    (free gerald t1200)
    (free gerald t1230)
    (free gerald t1400)
    (free gerald t1530)

    (free roy t0900) (free roy t0930) (free roy t1000) (free roy t1030)
    (free roy t1100) (free roy t1130) (free roy t1200) (free roy t1230)
    (free roy t1300) (free roy t1330) (free roy t1400) (free roy t1430)
    (free roy t1500) (free roy t1530) (free roy t1600) (free roy t1630)

    (free barbara t0900)
    (free barbara t1000)
    (free barbara t1030)
    (free barbara t1100)
    (free barbara t1400)
    (free barbara t1500)

    (gerald-pref t1300) (gerald-pref t1330) (gerald-pref t1400) (gerald-pref t1430)
    (gerald-pref t1500) (gerald-pref t1530) (gerald-pref t1600) (gerald-pref t1630)
    (gerald-nonpref t0900) (gerald-nonpref t0930) (gerald-nonpref t1000) (gerald-nonpref t1030)
    (gerald-nonpref t1100) (gerald-nonpref t1130) (gerald-nonpref t1200) (gerald-nonpref t1230)
  )
  (:goal
    (or
      (meeting-scheduled t0900) (meeting-scheduled t0930) (meeting-scheduled t1000) (meeting-scheduled t1030)
      (meeting-scheduled t1100) (meeting-scheduled t1130) (meeting-scheduled t1200) (meeting-scheduled t1230)
      (meeting-scheduled t1300) (meeting-scheduled t1330) (meeting-scheduled t1400) (meeting-scheduled t1430)
      (meeting-scheduled t1500) (meeting-scheduled t1530) (meeting-scheduled t1600) (meeting-scheduled t1630)
    )
  )
  (:metric minimize (total-cost))
)