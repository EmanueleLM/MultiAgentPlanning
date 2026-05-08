(define (problem calendar_scheduling_problem)
  (:domain calendar_scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )
  (:init
    ;; Lisa's Availability
    ;; Busy on Monday: 9:00 to 10:00 (t0900, t0930), 10:30 to 11:30 (t1030, t1100), 12:30 to 13:00 (t1230), 16:00 to 16:30 (t1600)
    (available lisa t1000)
    (available lisa t1130)
    (available lisa t1200)
    (available lisa t1300)
    (available lisa t1330)
    (available lisa t1400)
    (available lisa t1430)
    (available lisa t1500)
    (available lisa t1530)
    (available lisa t1630)

    ;; Bobby's Availability
    ;; Busy on Monday: 9:00 to 9:30 (t0900), 10:00 to 10:30 (t1000), 11:30 to 12:00 (t1130), 15:00 to 15:30 (t1500)
    ;; Preference: avoid more meetings after 15:00 (t1500, t1530, t1600, t1630)
    (available bobby t0930)
    (available bobby t1030)
    (available bobby t1100)
    (available bobby t1200)
    (available bobby t1230)
    (available bobby t1300)
    (available bobby t1330)
    (available bobby t1400)
    (available bobby t1430)

    ;; Randy's Availability
    ;; Busy on Monday: 9:30 to 10:00 (t0930), 10:30 to 11:00 (t1030), 11:30 to 12:30 (t1130, t1200), 13:00 to 13:30 (t1300), 14:30 to 15:30 (t1430, t1500), 16:00 to 16:30 (t1600)
    (available randy t0900)
    (available randy t1000)
    (available randy t1100)
    (available randy t1230)
    (available randy t1330)
    (available randy t1400)
    (available randy t1530)
    (available randy t1630)
  )
  (:goal
    (meeting_scheduled)
  )
)