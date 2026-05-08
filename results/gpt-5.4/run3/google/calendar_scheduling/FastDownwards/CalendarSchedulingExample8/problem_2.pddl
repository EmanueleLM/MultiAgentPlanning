(define (problem calendar_scheduling_example8_problem)
  (:domain calendar_scheduling_example8)

  (:objects
    adam jerry matthew - participant
    s_0900_0930 s_0930_1000 s_1000_1030 s_1030_1100
    s_1100_1130 s_1130_1200 s_1200_1230 s_1230_1300
    s_1300_1330 s_1330_1400 s_1400_1430 s_1430_1500
    s_1500_1530 s_1530_1600 s_1600_1630 s_1630_1700 - slot
  )

  (:init
    (busy adam s_1000_1030)
    (busy adam s_1230_1300)
    (busy adam s_1330_1400)
    (busy adam s_1400_1430)

    (busy jerry s_0900_0930)
    (busy jerry s_1200_1230)
    (busy jerry s_1500_1530)
    (busy jerry s_1530_1600)

    (busy matthew s_0930_1000)
    (busy matthew s_1000_1030)
    (busy matthew s_1030_1100)
    (busy matthew s_1130_1200)
    (busy matthew s_1200_1230)
    (busy matthew s_1300_1330)
    (busy matthew s_1330_1400)
    (busy matthew s_1430_1500)
    (busy matthew s_1500_1530)
    (busy matthew s_1530_1600)
    (busy matthew s_1600_1630)
    (busy matthew s_1630_1700)

    (free_slot s_1100_1130)
  )

  (:goal
    (and
      (scheduled s_1100_1130)
    )
  )
)