(define (problem schedule_meeting_margaret_donna_helen_monday)
  (:domain meeting_schedule_monday_instance)

  (:objects
    margaret donna helen - participant
    meeting_1 - meeting
    s_0900_0930 s_0930_1000 s_1000_1030 s_1030_1100
    s_1100_1130 s_1130_1200 s_1200_1230 s_1230_1300
    s_1300_1330 s_1330_1400 s_1400_1430 s_1430_1500
    s_1500_1530 s_1530_1600 s_1600_1630 s_1630_1700 - slot
  )

  (:init
    (unscheduled meeting_1)

    (meeting_participant meeting_1 margaret)
    (meeting_participant meeting_1 donna)
    (meeting_participant meeting_1 helen)

    (allowed_for_meeting meeting_1 s_0900_0930)
    (allowed_for_meeting meeting_1 s_0930_1000)
    (allowed_for_meeting meeting_1 s_1000_1030)
    (allowed_for_meeting meeting_1 s_1030_1100)
    (allowed_for_meeting meeting_1 s_1100_1130)
    (allowed_for_meeting meeting_1 s_1130_1200)
    (allowed_for_meeting meeting_1 s_1200_1230)
    (allowed_for_meeting meeting_1 s_1230_1300)
    (allowed_for_meeting meeting_1 s_1300_1330)

    (participant_free margaret s_1000_1030)
    (participant_free margaret s_1100_1130)
    (participant_free margaret s_1200_1230)
    (participant_free margaret s_1230_1300)
    (participant_free margaret s_1330_1400)
    (participant_free margaret s_1400_1430)
    (participant_free margaret s_1430_1500)
    (participant_free margaret s_1530_1600)
    (participant_free margaret s_1600_1630)
    (participant_free margaret s_1630_1700)

    (participant_free donna s_0900_0930)
    (participant_free donna s_0930_1000)
    (participant_free donna s_1000_1030)
    (participant_free donna s_1030_1100)
    (participant_free donna s_1100_1130)
    (participant_free donna s_1130_1200)
    (participant_free donna s_1200_1230)
    (participant_free donna s_1230_1300)
    (participant_free donna s_1300_1330)
    (participant_free donna s_1330_1400)
    (participant_free donna s_1400_1430)
    (participant_free donna s_1500_1530)
    (participant_free donna s_1530_1600)
    (participant_free donna s_1630_1700)

    (participant_free helen s_0930_1000)
    (participant_free helen s_1130_1200)
    (participant_free helen s_1200_1230)
    (participant_free helen s_1230_1300)
    (participant_free helen s_1400_1430)
    (participant_free helen s_1500_1530)
  )

  (:goal
    (and
      (meeting_scheduled meeting_1)
    )
  )
)