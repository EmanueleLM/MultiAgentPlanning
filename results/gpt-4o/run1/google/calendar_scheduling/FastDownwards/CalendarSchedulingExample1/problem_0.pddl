(define (problem meeting_schedule_problem)
  (:domain meeting_schedule)

  (:objects
    raymond billy donald - participant
    time_0900 time_0930 time_1000 time_1030
    time_1100 time_1130 time_1200 time_1230
    time_1300 time_1330 time_1400 time_1430
    time_1500 time_1530 time_1600 time_1630
    time_1700 - time
  )

  (:init
    (next time_0900 time_0930)
    (next time_0930 time_1000)
    (next time_1000 time_1030)
    (next time_1030 time_1100)
    (next time_1100 time_1130)
    (next time_1130 time_1200)
    (next time_1200 time_1230)
    (next time_1230 time_1300)
    (next time_1300 time_1330)
    (next time_1330 time_1400)
    (next time_1400 time_1430)
    (next time_1430 time_1500)
    (next time_1500 time_1530)
    (next time_1530 time_1600)
    (next time_1600 time_1630)
    (next time_1630 time_1700)

    (available raymond time_0930)
    (available raymond time_1000)
    (available raymond time_1030)
    (available raymond time_1100)
    (available raymond time_1200)
    (available raymond time_1230)
    (available raymond time_1300)
    (available raymond time_1330)
    (available raymond time_1400)
    (available raymond time_1430)
    (available raymond time_1500)
    (available raymond time_1530)
    (available raymond time_1600)
    (available raymond time_1630)
    (available raymond time_1700)

    (available billy time_0900)
    (available billy time_0930)
    (available billy time_0930)
    (available billy time_1000)
    (available billy time_1030)
    (available billy time_1100)
    (available billy time_1130)
    (available billy time_1300)
    (available billy time_1330)
    (available billy time_1400)
    (available billy time_1430)
    (available billy time_1500)

    (available donald time_0930)
    (available donald time_1100)
    (available donald time_1130)
    (available donald time_1300)
    (available donald time_1330)
    (available donald time_1400)
    (available donald time_1430)
    (available donald time_1500)
    (available donald time_1530)

    (preferred billy time_1530)
    (preferred billy time_1600)
    (preferred billy time_1630)
    (preferred billy time_1700)
  )

  (:goal
    (meeting_scheduled)
  )
)