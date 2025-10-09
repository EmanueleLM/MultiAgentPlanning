(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  (:objects
    peter judith keith evelyn - participant
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )
  (:init
    ;; meeting not yet scheduled
    (unscheduled)

    ;; peter: busy 09:00-09:30, 10:30-11:00, 11:30-12:00, 12:30-13:00 => unavailable t0900,t1030,t1130,t1230
    (free peter t0930) (free peter t1000) (free peter t1100) (free peter t1200)
    (free peter t1300) (free peter t1330) (free peter t1400) (free peter t1430)
    (free peter t1500) (free peter t1530) (free peter t1600) (free peter t1630)

    ;; judith: no scheduled events on Monday; calendar wide open (free all slots)
    (free judith t0900) (free judith t0930) (free judith t1000) (free judith t1030)
    (free judith t1100) (free judith t1130) (free judith t1200) (free judith t1230)
    (free judith t1300) (free judith t1330) (free judith t1400) (free judith t1430)
    (free judith t1500) (free judith t1530) (free judith t1600) (free judith t1630)

    ;; keith: busy 11:30-12:00, 12:30-15:00, 15:30-16:00, 16:30-17:00 => unavailable t1130,t1230,t1300,t1330,t1400,t1430,t1530,t1630
    (free keith t0900) (free keith t0930) (free keith t1000) (free keith t1030)
    (free keith t1100) (free keith t1200) (free keith t1500) (free keith t1600)

    ;; evelyn: busy 09:00-12:30, 13:30-15:30, 16:30-17:00 => unavailable t0900,t0930,t1000,t1030,t1100,t1130,t1200,t1330,t1400,t1430,t1500,t1630
    (free evelyn t1230) (free evelyn t1300) (free evelyn t1530) (free evelyn t1600)
  )
  ;; Earliest feasible slot that satisfies all hard constraints is 16:00-16:30 (t1600).
  (:goal (scheduled t1600))
)