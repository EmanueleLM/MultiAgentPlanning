(define (problem schedule_emily_victoria_nancy_monday_earliest)
  (:domain meeting_schedule_monday_instance)

  (:objects
    emily victoria nancy - participant
    t_0900_0930 t_0930_1000 t_1000_1030 t_1030_1100
    t_1100_1130 t_1130_1200 t_1200_1230 t_1230_1300
    t_1300_1330 t_1330_1400 t_1400_1430 t_1430_1500
    t_1500_1530 t_1530_1600 t_1600_1630 t_1630_1700 - slot
  )

  (:init
    (meeting_unscheduled)

    (available emily t_0900_0930)
    (available emily t_0930_1000)
    (available emily t_1000_1030)
    (available emily t_1030_1100)
    (available emily t_1100_1130)
    (available emily t_1130_1200)
    (available emily t_1200_1230)
    (available emily t_1230_1300)
    (available emily t_1300_1330)
    (available emily t_1330_1400)
    (available emily t_1400_1430)
    (available emily t_1430_1500)
    (available emily t_1500_1530)
    (available emily t_1530_1600)
    (available emily t_1600_1630)
    (available emily t_1630_1700)

    (available victoria t_0900_0930)
    (available victoria t_0930_1000)
    (available victoria t_1000_1030)
    (available victoria t_1030_1100)
    (available victoria t_1100_1130)
    (available victoria t_1130_1200)
    (available victoria t_1200_1230)
    (available victoria t_1230_1300)
    (available victoria t_1300_1330)
    (available victoria t_1400_1430)
    (available victoria t_1530_1600)
    (available victoria t_1600_1630)

    (available nancy t_1400_1430)
    (available nancy t_1530_1600)
    (available nancy t_1600_1630)
    (available nancy t_1630_1700)
  )

  (:goal
    (and
      (scheduled t_1400_1430)
    )
  )
)