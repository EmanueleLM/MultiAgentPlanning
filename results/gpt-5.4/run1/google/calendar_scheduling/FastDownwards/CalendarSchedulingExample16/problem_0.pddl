(define (problem meeting_schedule_instance_monday_scott_gabriel_christine)
  (:domain meeting_schedule_monday_scott_gabriel_christine)

  (:objects
    scott gabriel christine - participant
    t_0900 t_0930 t_1000 t_1030 t_1100 t_1130 t_1200 t_1230
    t_1300 t_1330 t_1400 t_1430 t_1500 t_1530 t_1600 t_1630 - timeslot
  )

  (:init
    (next_slot t_0900 t_0930)
    (next_slot t_0930 t_1000)
    (next_slot t_1000 t_1030)
    (next_slot t_1030 t_1100)
    (next_slot t_1100 t_1130)
    (next_slot t_1130 t_1200)
    (next_slot t_1200 t_1230)
    (next_slot t_1230 t_1300)
    (next_slot t_1300 t_1330)
    (next_slot t_1330 t_1400)
    (next_slot t_1400 t_1430)
    (next_slot t_1430 t_1500)
    (next_slot t_1500 t_1530)
    (next_slot t_1530 t_1600)
    (next_slot t_1600 t_1630)

    (free scott t_0900)
    (free scott t_1030)
    (free scott t_1100)
    (free scott t_1130)
    (free scott t_1200)
    (free scott t_1230)
    (free scott t_1300)
    (free scott t_1400)
    (free scott t_1500)
    (free scott t_1600)

    (free gabriel t_0900)
    (free gabriel t_0930)
    (free gabriel t_1000)
    (free gabriel t_1030)
    (free gabriel t_1100)
    (free gabriel t_1130)
    (free gabriel t_1200)
    (free gabriel t_1230)
    (free gabriel t_1300)
    (free gabriel t_1330)
    (free gabriel t_1400)
    (free gabriel t_1430)
    (free gabriel t_1500)
    (free gabriel t_1530)
    (free gabriel t_1600)
    (free gabriel t_1630)

    (free christine t_1000)
    (free christine t_1230)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)