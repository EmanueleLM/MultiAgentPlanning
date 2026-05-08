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
    (required_for meeting_kathryn_charlotte_lauren kathryn)
    (required_for meeting_kathryn_charlotte_lauren charlotte)
    (required_for meeting_kathryn_charlotte_lauren lauren)

    (available kathryn s0930_1000)
    (available kathryn s1000_1030)
    (available kathryn s1100_1130)
    (available kathryn s1200_1230)
    (available kathryn s1230_1300)
    (available kathryn s1300_1330)
    (available kathryn s1430_1500)
    (available kathryn s1500_1530)
    (available kathryn s1530_1600)
    (available kathryn s1600_1630)

    (available charlotte s0900_0930)
    (available charlotte s0930_1000)
    (available charlotte s1000_1030)
    (available charlotte s1030_1100)
    (available charlotte s1100_1130)
    (available charlotte s1130_1200)
    (available charlotte s1230_1300)
    (available charlotte s1300_1330)
    (available charlotte s1330_1400)
    (available charlotte s1430_1500)
    (available charlotte s1500_1530)
    (available charlotte s1530_1600)
    (available charlotte s1630_1700)

    (available lauren s1000_1030)
    (available lauren s1030_1100)
    (available lauren s1100_1130)
    (available lauren s1130_1200)
    (available lauren s1230_1300)
    (available lauren s1300_1330)
    (available lauren s1430_1500)
    (available lauren s1600_1630)

    (allowed_slot meeting_kathryn_charlotte_lauren s0900_0930)
    (allowed_slot meeting_kathryn_charlotte_lauren s0930_1000)
    (allowed_slot meeting_kathryn_charlotte_lauren s1000_1030)
    (allowed_slot meeting_kathryn_charlotte_lauren s1030_1100)
    (allowed_slot meeting_kathryn_charlotte_lauren s1100_1130)
    (allowed_slot meeting_kathryn_charlotte_lauren s1130_1200)
    (allowed_slot meeting_kathryn_charlotte_lauren s1200_1230)
    (allowed_slot meeting_kathryn_charlotte_lauren s1230_1300)
    (allowed_slot meeting_kathryn_charlotte_lauren s1300_1330)
  )

  (:goal
    (and
      (scheduled meeting_kathryn_charlotte_lauren)
      (scheduled_at meeting_kathryn_charlotte_lauren s1000_1030)
    )
  )
)