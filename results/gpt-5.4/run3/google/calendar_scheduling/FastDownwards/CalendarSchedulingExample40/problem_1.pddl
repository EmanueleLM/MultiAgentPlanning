(define (problem schedule_meeting_jacob_gabriel_matthew_monday)
  (:domain meeting_schedule_monday_instance)

  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
    meeting_instance - meeting
  )

  (:init
    (unscheduled meeting_instance)

    (next_slot t0900 t0930)
    (next_slot t0930 t1000)
    (next_slot t1000 t1030)
    (next_slot t1030 t1100)
    (next_slot t1100 t1130)
    (next_slot t1130 t1200)
    (next_slot t1200 t1230)
    (next_slot t1230 t1300)
    (next_slot t1300 t1330)
    (next_slot t1330 t1400)
    (next_slot t1400 t1430)
    (next_slot t1430 t1500)
    (next_slot t1500 t1530)
    (next_slot t1530 t1600)
    (next_slot t1600 t1630)

    (free jacob t0900)
    (free jacob t0930)
    (free jacob t1100)
    (free jacob t1200)
    (free jacob t1230)
    (free jacob t1300)
    (free jacob t1330)
    (free jacob t1400)
    (free jacob t1430)
    (free jacob t1500)
    (free jacob t1530)
    (free jacob t1630)

    (free gabriel t0900)
    (free gabriel t1130)
    (free gabriel t1200)
    (free gabriel t1230)
    (free gabriel t1330)
    (free gabriel t1400)
    (free gabriel t1430)
    (free gabriel t1530)
    (free gabriel t1600)
    (free gabriel t1630)

    (free matthew t0930)
    (free matthew t1000)
    (free matthew t1100)
    (free matthew t1200)
    (free matthew t1400)
    (free matthew t1430)
    (free matthew t1500)
    (free matthew t1630)
  )

  (:goal
    (and
      (duration_two meeting_instance)
    )
  )
)