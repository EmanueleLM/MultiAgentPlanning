(define (problem calendar_scheduling_example5)
  (:domain monday_meeting_scheduling)

  (:objects
    kathryn charlotte lauren - participant
    s0900_0930 s0930_1000 s1000_1030 s1030_1100
    s1100_1130 s1130_1200 s1200_1230 s1230_1300
    s1300_1330 s1330_1400 s1400_1430 s1430_1500
    s1500_1530 s1530_1600 s1600_1630 s1630_1700 - slot
    meeting_kathryn_charlotte_lauren - meeting
  )

  (:init
    (meeting_to_schedule meeting_kathryn_charlotte_lauren)

    (free kathryn s0930_1000)
    (free kathryn s1000_1030)
    (free kathryn s1100_1130)
    (free kathryn s1200_1230)
    (free kathryn s1230_1300)
    (free kathryn s1300_1330)
    (free kathryn s1430_1500)
    (free kathryn s1500_1530)
    (free kathryn s1530_1600)
    (free kathryn s1600_1630)

    (free charlotte s0900_0930)
    (free charlotte s0930_1000)
    (free charlotte s1000_1030)
    (free charlotte s1030_1100)
    (free charlotte s1100_1130)
    (free charlotte s1130_1200)
    (free charlotte s1230_1300)
    (free charlotte s1300_1330)

    (free lauren s1000_1030)
    (free lauren s1030_1100)
    (free lauren s1100_1130)
    (free lauren s1130_1200)
    (free lauren s1230_1300)
    (free lauren s1300_1330)
    (free lauren s1430_1500)
    (free lauren s1600_1630)

    (allowed_slot meeting_kathryn_charlotte_lauren s0900_0930)
    (allowed_slot meeting_kathryn_charlotte_lauren s0930_1000)
    (allowed_slot meeting_kathryn_charlotte_lauren s1000_1030)
    (allowed_slot meeting_kathryn_charlotte_lauren s1030_1100)
    (allowed_slot meeting_kathryn_charlotte_lauren s1100_1130)
    (allowed_slot meeting_kathryn_charlotte_lauren s1130_1200)
    (allowed_slot meeting_kathryn_charlotte_lauren s1200_1230)
    (allowed_slot meeting_kathryn_charlotte_lauren s1230_1300)
    (allowed_slot meeting_kathryn_charlotte_lauren s1300_1330)

    (scheduled_at meeting_kathryn_charlotte_lauren s1000_1030)
  )

  (:goal
    (scheduled_at meeting_kathryn_charlotte_lauren s1000_1030)
  )
)