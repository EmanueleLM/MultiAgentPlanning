(define (problem schedule_monday_30min)
  (:domain meeting_scheduling)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
    heather nicholas zachary - participant
  )

  (:init
    ;; encode only busy facts (fewer facts than listing all free slots)
    ;; Heather busy: 09:00-09:30, 10:30-11:00, 13:00-14:00 (two slots), 14:30-15:00, 16:00-16:30
    (busy heather t0900)
    (busy heather t1030)
    (busy heather t1300)
    (busy heather t1330)
    (busy heather t1430)
    (busy heather t1600)

    ;; Zachary busy: 09:00-10:30 (3 slots), 11:00-12:00 (2 slots), 12:30-13:00, 13:30-16:30 (6 slots)
    (busy zachary t0900)
    (busy zachary t0930)
    (busy zachary t1000)
    (busy zachary t1100)
    (busy zachary t1130)
    (busy zachary t1230)
    (busy zachary t1330)
    (busy zachary t1400)
    (busy zachary t1430)
    (busy zachary t1500)
    (busy zachary t1530)
    (busy zachary t1600)

    ;; Nicholas: no busy facts (free all day)

    ;; Candidate selection encodes the auditor/orchestrator recommended pre-14:00 slot
    ;; (soft preference resolved by selecting the recommended slot as the only candidate)
    (candidate t1200)
  )

  (:goal (meeting_scheduled))
)