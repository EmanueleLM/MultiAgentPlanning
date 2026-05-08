(define (problem schedule_meeting_jeffrey_virginia_melissa_monday)
  (:domain meeting_schedule_monday_instance)

  (:objects
    jeffrey virginia melissa - participant
    meeting_1 - meeting
    monday - day
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
    (unscheduled meeting_1)

    (requires meeting_1 jeffrey)
    (requires meeting_1 virginia)
    (requires meeting_1 melissa)

    (is_monday monday)

    (slot_on_day s_0900_0930 monday)
    (slot_on_day s_0930_1000 monday)
    (slot_on_day s_1000_1030 monday)
    (slot_on_day s_1030_1100 monday)
    (slot_on_day s_1100_1130 monday)
    (slot_on_day s_1130_1200 monday)
    (slot_on_day s_1200_1230 monday)
    (slot_on_day s_1230_1300 monday)
    (slot_on_day s_1300_1330 monday)
    (slot_on_day s_1330_1400 monday)
    (slot_on_day s_1400_1430 monday)
    (slot_on_day s_1430_1500 monday)
    (slot_on_day s_1500_1530 monday)
    (slot_on_day s_1530_1600 monday)
    (slot_on_day s_1600_1630 monday)
    (slot_on_day s_1630_1700 monday)

    (allowed_for_meeting meeting_1 s_0900_0930)
    (allowed_for_meeting meeting_1 s_0930_1000)
    (allowed_for_meeting meeting_1 s_1000_1030)
    (allowed_for_meeting meeting_1 s_1030_1100)
    (allowed_for_meeting meeting_1 s_1100_1130)
    (allowed_for_meeting meeting_1 s_1130_1200)
    (allowed_for_meeting meeting_1 s_1200_1230)
    (allowed_for_meeting meeting_1 s_1230_1300)
    (allowed_for_meeting meeting_1 s_1300_1330)
    (allowed_for_meeting meeting_1 s_1330_1400)

    (participant_free jeffrey s_0900_0930)
    (participant_free jeffrey s_1000_1030)
    (participant_free jeffrey s_1100_1130)
    (participant_free jeffrey s_1130_1200)
    (participant_free jeffrey s_1200_1230)
    (participant_free jeffrey s_1230_1300)
    (participant_free jeffrey s_1300_1330)
    (participant_free jeffrey s_1330_1400)
    (participant_free jeffrey s_1400_1430)
    (participant_free jeffrey s_1430_1500)
    (participant_free jeffrey s_1500_1530)
    (participant_free jeffrey s_1530_1600)
    (participant_free jeffrey s_1600_1630)
    (participant_free jeffrey s_1630_1700)

    (participant_free virginia s_0930_1000)
    (participant_free virginia s_1030_1100)
    (participant_free virginia s_1100_1130)
    (participant_free virginia s_1130_1200)
    (participant_free virginia s_1200_1230)
    (participant_free virginia s_1230_1300)
    (participant_free virginia s_1300_1330)
    (participant_free virginia s_1330_1400)
    (participant_free virginia s_1400_1430)
    (participant_free virginia s_1500_1530)
    (participant_free virginia s_1530_1600)
    (participant_free virginia s_1630_1700)

    (participant_free melissa s_1130_1200)
    (participant_free melissa s_1230_1300)
    (participant_free melissa s_1500_1530)
    (participant_free melissa s_1530_1600)
  )

  (:goal
    (and
      (meeting_scheduled meeting_1)
      (not (unscheduled meeting_1))
    )
  )
)