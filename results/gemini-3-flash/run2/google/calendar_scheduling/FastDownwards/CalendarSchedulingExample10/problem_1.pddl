(define (problem schedule_meeting_v1)
  (:domain calendar_scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    (available diana t0900) (available diana t0930) (available diana t1000) (available diana t1030) (available diana t1100) (available diana t1200) (available diana t1230) (available diana t1330) (available diana t1400) (available diana t1430) (available diana t1500) (available diana t1530) (available diana t1600) (available diana t1630)
    (available ethan t0900) (available ethan t0930) (available ethan t1000) (available ethan t1030) (available ethan t1100) (available ethan t1130) (available ethan t1200) (available ethan t1230) (available ethan t1300) (available ethan t1330) (available ethan t1400) (available ethan t1430) (available ethan t1500) (available ethan t1530) (available ethan t1600) (available ethan t1630)
    (available janet t1000) (available janet t1030) (available janet t1100) (available janet t1130)
  )
  (:goal (scheduled))
)