(define (problem meeting_schedule_monday_instance)
  (:domain meeting_schedule_monday)

  (:objects
    s_0900_0930
    s_0930_1000
    s_1000_1030
    s_1030_1100
    s_1100_1130
    s_1130_1200
    s_1200_1230
    s_1230_1300
    s_1300_1330
    s_1330_1400
    s_1400_1430
    s_1430_1500
    s_1500_1530
    s_1530_1600
    s_1600_1630
    s_1630_1700 - slot
  )

  (:init
    (busy joyce s_1100_1130)
    (busy joyce s_1330_1400)
    (busy joyce s_1430_1500)
    (busy joyce s_1500_1530)
    (busy joyce s_1530_1600)
    (busy joyce s_1600_1630)

    (busy christine s_0900_0930)
    (busy christine s_0930_1000)
    (busy christine s_1000_1030)
    (busy christine s_1030_1100)
    (busy christine s_1100_1130)
    (busy christine s_1130_1200)

    (busy alexander s_0900_0930)
    (busy alexander s_0930_1000)
    (busy alexander s_1000_1030)
    (busy alexander s_1030_1100)
    (busy alexander s_1200_1230)
    (busy alexander s_1330_1400)
    (busy alexander s_1400_1430)
    (busy alexander s_1430_1500)
    (busy alexander s_1530_1600)
    (busy alexander s_1630_1700)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)