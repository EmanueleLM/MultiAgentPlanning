(define (problem schedule_monday_30min)
  (:domain meeting_scheduling)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 - timeslot
    heather nicholas zachary - participant
  )

  (:init
    ;; Heather's busy slots
    (busy heather t0900)
    (busy heather t1030)
    (busy heather t1300)
    (busy heather t1330)
    (busy heather t1430)
    (busy heather t1600)

    ;; Zachary's busy slots
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
  )

  (:goal (and
    (meeting_scheduled)
    (scheduled_at t1200)
  ))
)