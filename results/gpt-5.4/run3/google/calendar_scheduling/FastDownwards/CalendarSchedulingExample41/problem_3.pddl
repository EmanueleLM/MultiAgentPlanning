(define (problem calendar_scheduling_example41)
  (:domain meeting_schedule_monday_instance)

  (:objects
    t_0900 t_0930 t_1000 t_1030 t_1100 t_1130 t_1200 t_1230
    t_1300 t_1330 t_1400 t_1430 t_1500 t_1530 t_1600 t_1630 - slot
  )

  (:init
    (available alan t_1430)
    (available alan t_1500)
    (available alan t_1530)
    (available alan t_1600)
    (available alan t_1630)

    (available nancy t_0900)
    (available nancy t_0930)
    (available nancy t_1000)
    (available nancy t_1030)
    (available nancy t_1230)
    (available nancy t_1330)
    (available nancy t_1500)
    (available nancy t_1530)
    (available nancy t_1600)
    (available nancy t_1630)

    (available patricia t_0900)
    (available patricia t_0930)
    (available patricia t_1200)
    (available patricia t_1300)
    (available patricia t_1600)
    (available patricia t_1630)
  )

  (:goal
    (meeting_scheduled)
  )
)