(define (problem schedule_monday_30min)
  (:domain meeting_scheduling)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
    heather nicholas zachary - participant
  )

  (:init
    ; work-hour slot start times (09:00 .. 16:30)
    (within_work_hours t0900)
    (within_work_hours t0930)
    (within_work_hours t1000)
    (within_work_hours t1030)
    (within_work_hours t1100)
    (within_work_hours t1130)
    (within_work_hours t1200)
    (within_work_hours t1230)
    (within_work_hours t1300)
    (within_work_hours t1330)
    (within_work_hours t1400)
    (within_work_hours t1430)
    (within_work_hours t1500)
    (within_work_hours t1530)
    (within_work_hours t1600)
    (within_work_hours t1630)

    ; successor/ordering relation on 30-minute grid (explicit ordered stages)
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)

    ; Heather's busy slots (given)
    (busy heather t0900)
    (busy heather t1030)
    (busy heather t1300)
    (busy heather t1330)
    (busy heather t1430)
    (busy heather t1600)

    ; Nicholas has no busy slots on Monday (implicitly free)

    ; Zachary's busy slots (given)
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

  ; Goal: schedule exactly one meeting and place it at the recommended pre-14:00 slot t1200.
  ; This encodes the auditor/orchestrator decision to prefer a pre-14:00 feasible slot when available.
  (:goal (and
    (meeting_scheduled)
    (scheduled_at t1200)
  ))
)