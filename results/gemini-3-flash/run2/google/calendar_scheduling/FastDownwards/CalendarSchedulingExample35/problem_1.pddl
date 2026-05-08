(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ;; Bradley is free all day (9:00 to 17:00) but does not want to meet before 14:30.
    ;; His availability for a 30-minute meeting is therefore 14:30 to 17:00.
    (free bradley t1430)
    (free bradley t1500)
    (free bradley t1530)
    (free bradley t1600)
    (free bradley t1630)

    ;; Zachary has meetings on Monday during 10:00 to 10:30 and 15:00 to 15:30.
    ;; Zachary is free during all other work hours (9:00 to 17:00).
    (free zachary t0900)
    (free zachary t0930)
    ;; 10:00 to 10:30: t1000 is busy
    (free zachary t1030)
    (free zachary t1100)
    (free zachary t1130)
    (free zachary t1200)
    (free zachary t1230)
    (free zachary t1300)
    (free zachary t1330)
    (free zachary t1400)
    (free zachary t1430)
    ;; 15:00 to 15:30: t1500 is busy
    (free zachary t1530)
    (free zachary t1600)
    (free zachary t1630)

    ;; Teresa has blocked their calendar on Monday during:
    ;; 9:00 to 10:30: t0900, t0930, t1000 are busy
    ;; 11:00 to 12:30: t1100, t1130, t1200 are busy
    ;; 13:00 to 14:00: t1300, t1330 are busy
    ;; 14:30 to 16:30: t1430, t1500, t1530, t1600 are busy
    (free teresa t1030)
    (free teresa t1230)
    (free teresa t1400)
    (free teresa t1630)
  )
  (:goal (meeting_scheduled))
)