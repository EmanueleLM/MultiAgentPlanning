(define (problem schedule-meeting)
  (:domain meeting-domain)
  (:objects
    ;; agents
    diana ethan janet

    ;; 30-minute slot start times on Monday from 09:00 to 16:30 (meeting length 30 minutes)
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630
  )

  (:init
    ;; declare agents and slots
    (agent diana) (agent ethan) (agent janet)
    (slot t0900) (slot t0930) (slot t1000) (slot t1030) (slot t1100) (slot t1130) (slot t1200) (slot t1230)
    (slot t1300) (slot t1330) (slot t1400) (slot t1430) (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    ;; Ethan: no meetings on Monday -> free for all slots
    (free ethan t0900) (free ethan t0930) (free ethan t1000) (free ethan t1030)
    (free ethan t1100) (free ethan t1130) (free ethan t1200) (free ethan t1230)
    (free ethan t1300) (free ethan t1330) (free ethan t1400) (free ethan t1430)
    (free ethan t1500) (free ethan t1530) (free ethan t1600) (free ethan t1630)

    ;; Diana: busy 11:30-12:00 (t1130) and 13:00-13:30 (t1300) -> free at all other slots
    (free diana t0900) (free diana t0930) (free diana t1000) (free diana t1030)
    (free diana t1100)                 ;; not t1130
    (free diana t1200) (free diana t1230)
                 ;; not t1300
    (free diana t1330) (free diana t1400) (free diana t1430) (free diana t1500)
    (free diana t1530) (free diana t1600) (free diana t1630)

    ;; Janet: busy 09:00-10:00 (t0900,t0930), busy 12:30-13:00 (t1230), busy 14:00-15:00 (t1400,t1430),
    ;; busy 15:30-17:00 (t1530,t1600,t1630). Also prefers not to meet after 12:00 -> we treat that preference as a constraint:
    ;; she is only considered free for slots that start at or before 11:00 (so meeting will end by 12:00)
    (free janet t1000) (free janet t1030) (free janet t1100)
    ;; other slots not declared free for janet (either busy or outside preference)
  )

  ;; Goal: a meeting has been scheduled that fits all participants' availabilities/preferences
  (:goal (meeting-scheduled))
)