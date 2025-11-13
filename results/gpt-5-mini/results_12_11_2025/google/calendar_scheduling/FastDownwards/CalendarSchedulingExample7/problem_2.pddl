(define (problem schedule_monday_30min)
  (:domain meeting_scheduling)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
    heather nicholas zachary - participant
  )

  (:init
    ;; mark slots within the workday
    (in_workday t0900) (in_workday t0930) (in_workday t1000) (in_workday t1030)
    (in_workday t1100) (in_workday t1130) (in_workday t1200) (in_workday t1230)
    (in_workday t1300) (in_workday t1330) (in_workday t1400) (in_workday t1430)
    (in_workday t1500) (in_workday t1530) (in_workday t1600) (in_workday t1630)

    ;; successor (ordering) relation on 30-minute grid
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    ;; Heather busy: 09:00-09:30 (t0900), 10:30-11:00 (t1030), 13:00-14:00 (t1300,t1330),
    ;; 14:30-15:00 (t1430), 16:00-16:30 (t1600).
    ;; Heather free slots (all other in_workday slots)
    (free_heather t0930)
    (free_heather t1000)
    (free_heather t1100)
    (free_heather t1130)
    (free_heather t1200)
    (free_heather t1230)
    (free_heather t1400)
    (free_heather t1500)
    (free_heather t1530)
    (free_heather t1630)

    ;; Nicholas has no meetings the whole day (free all slots)
    (free_nicholas t0900) (free_nicholas t0930) (free_nicholas t1000) (free_nicholas t1030)
    (free_nicholas t1100) (free_nicholas t1130) (free_nicholas t1200) (free_nicholas t1230)
    (free_nicholas t1300) (free_nicholas t1330) (free_nicholas t1400) (free_nicholas t1430)
    (free_nicholas t1500) (free_nicholas t1530) (free_nicholas t1600) (free_nicholas t1630)

    ;; Zachary busy: 09:00-10:30 (t0900,t0930,t1000), 11:00-12:00 (t1100,t1130),
    ;; 12:30-13:00 (t1230), 13:30-16:30 (t1330,t1400,t1430,t1500,t1530,t1600).
    ;; Zachary free slots:
    (free_zachary t1030)
    (free_zachary t1200)
    (free_zachary t1300)
    (free_zachary t1630)

    ;; Soft preference resolution: prefer pre-14:00 feasible slot when one exists.
    ;; The audited feasible common slots are t1200 and t1630; mark the preferred pre-14:00 slot as choosable.
    (choosable t1200)
  )

  (:goal (meeting_scheduled))
)