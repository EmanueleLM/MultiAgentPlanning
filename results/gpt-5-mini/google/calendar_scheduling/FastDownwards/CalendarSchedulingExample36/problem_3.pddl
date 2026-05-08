(define (problem schedule_meeting_monday)
  (:domain calendar_scheduling)
  (:objects
    ryan ruth denise - person
    meeting1 - meeting
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )

  (:init
    ;; successor (30-minute) chain
    (next t0900 t0930)
    (next t0930 t1000)
    (next t1000 t1030)
    (next t1030 t1100)
    (next t1100 t1130)
    (next t1130 t1200)
    (next t1200 t1230)
    (next t1230 t1300)
    (next t1300 t1330)
    (next t1330 t1400)
    (next t1400 t1430)
    (next t1430 t1500)
    (next t1500 t1530)
    (next t1530 t1600)
    (next t1600 t1630)

    ;; allowed start times (meeting must finish by 12:30 -> latest start is 11:30)
    (allowed_start t0900)
    (allowed_start t0930)
    (allowed_start t1000)
    (allowed_start t1030)
    (allowed_start t1100)
    (allowed_start t1130)

    ;; free facts derived from given busy intervals
    ;; ryan busy: 9:00-9:30 (t0900), 12:30-13:00 (t1230) -> free elsewhere
    (free ryan t0930)
    (free ryan t1000)
    (free ryan t1030)
    (free ryan t1100)
    (free ryan t1130)
    (free ryan t1200)
    (free ryan t1300)
    (free ryan t1330)
    (free ryan t1400)
    (free ryan t1430)
    (free ryan t1500)
    (free ryan t1530)
    (free ryan t1600)
    (free ryan t1630)

    ;; ruth has no meetings the whole day
    (free ruth t0900)
    (free ruth t0930)
    (free ruth t1000)
    (free ruth t1030)
    (free ruth t1100)
    (free ruth t1130)
    (free ruth t1200)
    (free ruth t1230)
    (free ruth t1300)
    (free ruth t1330)
    (free ruth t1400)
    (free ruth t1430)
    (free ruth t1500)
    (free ruth t1530)
    (free ruth t1600)
    (free ruth t1630)

    ;; denise busy: 9:30-10:30 (t0930,t1000); 12:00-13:00 (t1200,t1230); 14:30-16:30 (t1430,t1500,t1530,t1600)
    ;; free at remaining slots
    (free denise t0900)
    (free denise t1030)
    (free denise t1100)
    (free denise t1130)
    (free denise t1300)
    (free denise t1330)
    (free denise t1400)
    (free denise t1630)
  )

  ;; goal: schedule the meeting (participants will be provided when applying the action)
  (:goal (and (scheduled meeting1)))
)