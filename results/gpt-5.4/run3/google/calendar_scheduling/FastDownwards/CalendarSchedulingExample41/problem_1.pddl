(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    alan nancy patricia - participant
    t_0900 t_0930 t_1000 t_1030 t_1100 t_1130 t_1200 t_1230
    t_1300 t_1330 t_1400 t_1430 t_1500 t_1530 t_1600 t_1630 - slot
  )

  (:init
    (unscheduled)

    (free alan t_1430)
    (free alan t_1500)
    (free alan t_1530)
    (free alan t_1600)
    (free alan t_1630)

    (free nancy t_0900)
    (free nancy t_0930)
    (free nancy t_1000)
    (free nancy t_1030)
    (free nancy t_1230)
    (free nancy t_1330)
    (free nancy t_1500)
    (free nancy t_1530)
    (free nancy t_1600)
    (free nancy t_1630)

    (free patricia t_0900)
    (free patricia t_0930)
    (free patricia t_1200)
    (free patricia t_1300)
    (free patricia t_1600)
    (free patricia t_1630)
  )

  (:goal
    (and
      (scheduled)
      (chosen_slot t_1600)
    )
  )
)