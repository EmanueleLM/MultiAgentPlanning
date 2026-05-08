(define (problem schedule_meeting_1_monday)
  (:domain meeting_schedule_monday_instance)

  (:objects
    bradley zachary teresa - participant
    meeting_1 - meeting
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  (:init
    (allowed_start meeting_1 t1430)
    (allowed_start meeting_1 t1500)
    (allowed_start meeting_1 t1530)
    (allowed_start meeting_1 t1600)
    (allowed_start meeting_1 t1630)

    (free bradley t0900)
    (free bradley t0930)
    (free bradley t1000)
    (free bradley t1030)
    (free bradley t1100)
    (free bradley t1130)
    (free bradley t1200)
    (free bradley t1230)
    (free bradley t1300)
    (free bradley t1330)
    (free bradley t1400)
    (free bradley t1430)
    (free bradley t1500)
    (free bradley t1530)
    (free bradley t1600)
    (free bradley t1630)

    (free zachary t0900)
    (free zachary t0930)
    (free zachary t1030)
    (free zachary t1100)
    (free zachary t1130)
    (free zachary t1200)
    (free zachary t1230)
    (free zachary t1300)
    (free zachary t1330)
    (free zachary t1400)
    (free zachary t1430)
    (free zachary t1530)
    (free zachary t1600)
    (free zachary t1630)

    (free teresa t1030)
    (free teresa t1230)
    (free teresa t1400)
    (free teresa t1630)
  )

  (:goal
    (and
      (scheduled meeting_1)
      (meeting_at meeting_1 t1630)
    )
  )
)