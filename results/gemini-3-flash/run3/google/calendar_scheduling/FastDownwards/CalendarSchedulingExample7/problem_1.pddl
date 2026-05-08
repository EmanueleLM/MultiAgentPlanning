(define (problem calendar_scheduling_example7)
  (:domain calendar_scheduling)
  (:objects
    heather nicholas zachary - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ;; Heather's existing schedule: blocked 9:00-9:30, 10:30-11:00, 13:00-14:00, 14:30-15:00, 16:00-16:30
    ;; Free: 9:30, 10:00, 11:00, 11:30, 12:00, 12:30, 14:00, 15:00, 15:30, 16:30
    (free heather t0930)
    (free heather t1000)
    (free heather t1100)
    (free heather t1130)
    (free heather t1200)
    (free heather t1230)
    (free heather t1400)
    (free heather t1500)
    (free heather t1530)
    (free heather t1630)

    ;; Nicholas's existing schedule: no meetings the whole day
    ;; Free: all slots
    (free nicholas t0900)
    (free nicholas t0930)
    (free nicholas t1000)
    (free nicholas t1030)
    (free nicholas t1100)
    (free nicholas t1130)
    (free nicholas t1200)
    (free nicholas t1230)
    (free nicholas t1300)
    (free nicholas t1330)
    (free nicholas t1400)
    (free nicholas t1430)
    (free nicholas t1500)
    (free nicholas t1530)
    (free nicholas t1600)
    (free nicholas t1630)

    ;; Zachary's existing schedule: blocked 9:00-10:30, 11:00-12:00, 12:30-13:00, 13:30-16:30
    ;; Zachary Preference: Rather not meet after 14:00.
    ;; Free and preferred: 10:30-11:00, 12:00-12:30, 13:00-13:30
    (free zachary t1030)
    (free zachary t1200)
    (free zachary t1300)
    ;; Slot t1630 is also free but violates Zachary's preference of not meeting after 14:00.
  )
  (:goal (any_meeting_scheduled))
)