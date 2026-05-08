(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    meeting_1 - meeting
    s_0900_0930 s_0930_1000 s_1000_1030 s_1030_1100
    s_1100_1130 s_1130_1200 s_1200_1230 s_1230_1300
    s_1300_1330 s_1330_1400 s_1400_1430 s_1430_1500
    s_1500_1530 s_1530_1600 s_1600_1630 s_1630_1700 - slot
  )

  (:init
    (required meeting_1 jesse)
    (required meeting_1 kathryn)
    (required meeting_1 megan)

    (current_slot s_0900_0930)

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

    (free jesse s_0900_0930)
    (free jesse s_0930_1000)
    (free jesse s_1030_1100)
    (free jesse s_1100_1130)
    (free jesse s_1130_1200)
    (free jesse s_1200_1230)
    (free jesse s_1230_1300)
    (free jesse s_1300_1330)
    (free jesse s_1330_1400)
    (free jesse s_1400_1430)
    (free jesse s_1430_1500)
    (free jesse s_1500_1530)
    (free jesse s_1600_1630)
    (free jesse s_1630_1700)

    (free kathryn s_0900_0930)
    (free kathryn s_0930_1000)
    (free kathryn s_1000_1030)
    (free kathryn s_1030_1100)
    (free kathryn s_1100_1130)
    (free kathryn s_1130_1200)
    (free kathryn s_1200_1230)
    (free kathryn s_1230_1300)
    (free kathryn s_1300_1330)
    (free kathryn s_1330_1400)
    (free kathryn s_1400_1430)
    (free kathryn s_1430_1500)
    (free kathryn s_1500_1530)
    (free kathryn s_1530_1600)
    (free kathryn s_1600_1630)
    (free kathryn s_1630_1700)

    (free megan s_0900_0930)
    (free megan s_0930_1000)
    (free megan s_1000_1030)
    (free megan s_1100_1130)
    (free megan s_1230_1300)
    (free megan s_1300_1330)
    (free megan s_1430_1500)
    (free megan s_1630_1700)
  )

  (:goal
    (and
      (meeting_scheduled meeting_1)
    )
  )
)