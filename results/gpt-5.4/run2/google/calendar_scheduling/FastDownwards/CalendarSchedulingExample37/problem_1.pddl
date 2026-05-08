(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    gregory teresa carol - participant
    meeting_1 - meeting
    t_0900 t_0930 t_1000 t_1030 t_1100 t_1130 t_1200 t_1230
    t_1300 t_1330 t_1400 t_1430 t_1500 t_1530 t_1600 t_1630 - timeslot
  )

  (:init
    (required meeting_1 gregory)
    (required meeting_1 teresa)
    (required meeting_1 carol)

    (free gregory t_0900)
    (free gregory t_0930)
    (free gregory t_1000)
    (free gregory t_1030)
    (free gregory t_1130)
    (free gregory t_1230)
    (free gregory t_1300)
    (free gregory t_1330)
    (free gregory t_1400)
    (free gregory t_1430)
    (free gregory t_1500)
    (free gregory t_1630)

    (free teresa t_0900)
    (free teresa t_0930)
    (free teresa t_1000)
    (free teresa t_1030)
    (free teresa t_1100)
    (free teresa t_1130)
    (free teresa t_1200)
    (free teresa t_1230)
    (free teresa t_1300)
    (free teresa t_1330)
    (free teresa t_1400)
    (free teresa t_1430)
    (free teresa t_1500)
    (free teresa t_1530)
    (free teresa t_1600)
    (free teresa t_1630)

    (free carol t_1030)
    (free carol t_1600)
  )

  (:goal
    (and
      (scheduled meeting_1)
    )
  )
)