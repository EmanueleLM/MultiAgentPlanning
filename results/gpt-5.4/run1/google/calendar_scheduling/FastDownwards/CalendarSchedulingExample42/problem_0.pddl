(define (problem meeting_schedule_monday_instance)
  (:domain meeting_schedule_monday)

  (:objects
    julie sean lori - participant
    s_0900_0930 s_0930_1000 s_1000_1030 s_1030_1100
    s_1100_1130 s_1130_1200 s_1200_1230 s_1230_1300
    s_1300_1330 s_1330_1400 s_1400_1430 s_1430_1500
    s_1500_1530 s_1530_1600 s_1600_1630 s_1630_1700 - slot
  )

  (:init
    (next_slot s_0900_0930 s_0930_1000)
    (next_slot s_0930_1000 s_1000_1030)
    (next_slot s_1000_1030 s_1030_1100)
    (next_slot s_1030_1100 s_1100_1130)
    (next_slot s_1100_1130 s_1130_1200)
    (next_slot s_1130_1200 s_1200_1230)
    (next_slot s_1200_1230 s_1230_1300)
    (next_slot s_1230_1300 s_1300_1330)
    (next_slot s_1300_1330 s_1330_1400)
    (next_slot s_1330_1400 s_1400_1430)
    (next_slot s_1400_1430 s_1430_1500)
    (next_slot s_1430_1500 s_1500_1530)
    (next_slot s_1500_1530 s_1530_1600)
    (next_slot s_1530_1600 s_1600_1630)
    (next_slot s_1600_1630 s_1630_1700)

    (busy julie s_0900_0930)
    (busy julie s_1100_1130)
    (busy julie s_1200_1230)
    (busy julie s_1330_1400)
    (busy julie s_1600_1630)
    (busy julie s_1630_1700)

    (busy sean s_0900_0930)
    (busy sean s_1300_1330)
    (busy sean s_1500_1530)
    (busy sean s_1600_1630)

    (busy lori s_1000_1030)
    (busy lori s_1100_1130)
    (busy lori s_1130_1200)
    (busy lori s_1200_1230)
    (busy lori s_1230_1300)
    (busy lori s_1530_1600)
    (busy lori s_1600_1630)
    (busy lori s_1630_1700)
  )

  (:goal
    (and
      (scheduled)
    )
  )
)