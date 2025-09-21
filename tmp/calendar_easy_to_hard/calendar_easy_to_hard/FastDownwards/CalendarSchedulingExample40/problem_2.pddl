(define (problem schedule-meeting-mon)
  (:domain meeting-scheduling)
  (:objects
    rachel katherine kelly cynthia anthony ryan richard - participant
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )

  (:init
    ; Rachel - free entire day
    (available rachel t0900) (available rachel t0930) (available rachel t1000) (available rachel t1030)
    (available rachel t1100) (available rachel t1130) (available rachel t1200) (available rachel t1230)
    (available rachel t1300) (available rachel t1330) (available rachel t1400) (available rachel t1430)
    (available rachel t1500) (available rachel t1530) (available rachel t1600) (available rachel t1630)

    ; Katherine busy 10:00-11:00,12:30-13:00,14:00-15:00,16:00-16:30 -> unavailable t1000,t1030,t1230,t1400,t1430,t1600
    (available katherine t0900) (available katherine t0930)
    (available katherine t1100) (available katherine t1130) (available katherine t1200)
    (available katherine t1300) (available katherine t1330) (available katherine t1500)
    (available katherine t1530) (available katherine t1630)

    ; Kelly busy 11:30-12:30,13:00-14:30,16:00-16:30 -> unavailable t1130,t1200,t1300,t1330,t1400,t1600
    (available kelly t0900) (available kelly t0930) (available kelly t1000) (available kelly t1030)
    (available kelly t1100) (available kelly t1230) (available kelly t1430)
    (available kelly t1500) (available kelly t1530) (available kelly t1630)

    ; Cynthia busy 13:30-14:00,14:30-15:30,16:00-16:30 -> unavailable t1330,t1430,t1500,t1600
    (available cynthia t0900) (available cynthia t0930) (available cynthia t1000) (available cynthia t1030)
    (available cynthia t1100) (available cynthia t1130) (available cynthia t1200) (available cynthia t1230)
    (available cynthia t1300) (available cynthia t1400) (available cynthia t1530) (available cynthia t1630)

    ; Anthony busy 09:00-11:00 and 12:00-17:00 -> unavailable t0900,t0930,t1000,t1030 and t1200..t1630
    (available anthony t1100) (available anthony t1130)

    ; Ryan busy 09:00-11:00,12:30-13:30,14:00-14:30,15:00-16:30 -> unavailable t0900,t0930,t1000,t1030,t1230,t1300,t1400,t1500,t1530,t1600
    (available ryan t1100) (available ryan t1130) (available ryan t1200)
    (available ryan t1330) (available ryan t1430) (available ryan t1630)

    ; Richard busy 09:30-10:30,12:00-13:30,15:30-17:00 -> unavailable t0930,t1000,t1200,t1230,t1300,t1530,t1600,t1630
    (available richard t0900) (available richard t1030)
    (available richard t1100) (available richard t1130)
    (available richard t1330) (available richard t1400) (available richard t1430) (available richard t1500)
  )

  (:goal (and (meeting-scheduled) (meeting-at t1100)))
)