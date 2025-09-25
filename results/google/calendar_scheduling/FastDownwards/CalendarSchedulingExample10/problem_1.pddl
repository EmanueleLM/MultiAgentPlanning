(define (problem schedule-meeting)
  (:domain meeting-domain)
  (:objects
    diana ethan janet
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630
  )
  (:init
    (agent diana) (agent ethan) (agent janet)
    (slot t0900) (slot t0930) (slot t1000) (slot t1030) (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430) (slot t1500) (slot t1530) (slot t1600) (slot t1630)
    (free ethan t0900) (free ethan t0930) (free ethan t1000) (free ethan t1030)
    (free ethan t1100) (free ethan t1130) (free ethan t1200) (free ethan t1230)
    (free ethan t1300) (free ethan t1330) (free ethan t1400) (free ethan t1430)
    (free ethan t1500) (free ethan t1530) (free ethan t1600) (free ethan t1630)
    (free diana t0900) (free diana t0930) (free diana t1000) (free diana t1030)
    (free diana t1100) (free diana t1200) (free diana t1230)
    (free diana t1330) (free diana t1400) (free diana t1430) (free diana t1500)
    (free diana t1530) (free diana t1600) (free diana t1630)
    (free janet t1000) (free janet t1030) (free janet t1100)
  )
  (:goal (meeting-scheduled))
)