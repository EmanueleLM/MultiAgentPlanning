(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    ;; half-hour slots from 09:00 to 16:30 (last second slot for a 60-min meeting)
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630
    ;; agents
    madison diana shirley
  )

  (:init
    ;; declare slots
    (slot t0900) (slot t0930) (slot t1000) (slot t1030) (slot t1100) (slot t1130)
    (slot t1200) (slot t1230) (slot t1300) (slot t1330) (slot t1400) (slot t1430)
    (slot t1500) (slot t1530) (slot t1600) (slot t1630)

    ;; adjacency for consecutive half-hour slots
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    ;; Availability (free) facts derived from each agent's private busy times.
    ;; Madison: busy 09:30-10:00 (t0930) and 11:30-12:00 (t1130). Free otherwise.
    (free madison t0900) (free madison t1000) (free madison t1030) (free madison t1100)
    (free madison t1200) (free madison t1230) (free madison t1300) (free madison t1330)
    (free madison t1400) (free madison t1430) (free madison t1500) (free madison t1530)
    (free madison t1600) (free madison t1630)

    ;; Diana: busy 11:00-11:30 (t1100) and 13:00-13:30 (t1300). Free otherwise.
    (free diana t0900) (free diana t0930) (free diana t1000) (free diana t1030)
    (free diana t1130) (free diana t1200) (free diana t1230) (free diana t1330)
    (free diana t1400) (free diana t1430) (free diana t1500) (free diana t1530)
    (free diana t1600) (free diana t1630)

    ;; Shirley: busy 09:00-12:00 (t0900,t0930,t1000,t1030,t1100,t1130),
    ;;         busy 13:30-15:00 (t1330,t1400,t1430),
    ;;         busy 15:30-17:00 (t1530,t1600,t1630).
    ;; Thus free slots: t1200, t1230, t1300, t1500
    (free shirley t1200) (free shirley t1230) (free shirley t1300) (free shirley t1500)
  )

  ;; Goal: schedule a 60-minute meeting (two consecutive half-hour slots) where all participants attend.
  ;; Based on integrated availability the feasible start is at 12:00 (t1200 -> t1230).
  (:goal (meeting-scheduled t1200))
)