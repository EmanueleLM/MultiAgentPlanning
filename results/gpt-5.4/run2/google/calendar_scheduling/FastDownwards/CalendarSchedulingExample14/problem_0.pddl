(define (problem schedule_meeting_for_brandon_jerry_bradley_monday)
  (:domain meeting_schedule_monday_instance)

  (:objects
    brandon jerry bradley - participant
    meeting_1 - meeting
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

    (requires meeting_1 brandon)
    (requires meeting_1 jerry)
    (requires meeting_1 bradley)

    (busy brandon s_1300_1330)
    (busy brandon s_1330_1400)
    (busy brandon s_1530_1600)
    (busy brandon s_1630_1700)

    (busy bradley s_0900_0930)
    (busy bradley s_0930_1000)
    (busy bradley s_1000_1030)
    (busy bradley s_1030_1100)
    (busy bradley s_1100_1130)
    (busy bradley s_1200_1230)
    (busy bradley s_1230_1300)
    (busy bradley s_1300_1330)
    (busy bradley s_1330_1400)
    (busy bradley s_1400_1430)
    (busy bradley s_1430_1500)
    (busy bradley s_1600_1630)

    (disallowed_for_meeting meeting_1 s_0900_0930)
    (disallowed_for_meeting meeting_1 s_0930_1000)
    (disallowed_for_meeting meeting_1 s_1000_1030)
    (disallowed_for_meeting meeting_1 s_1030_1100)
    (disallowed_for_meeting meeting_1 s_1100_1130)
    (disallowed_for_meeting meeting_1 s_1130_1200)
    (disallowed_for_meeting meeting_1 s_1200_1230)
    (disallowed_for_meeting meeting_1 s_1230_1300)
    (disallowed_for_meeting meeting_1 s_1300_1330)
    (disallowed_for_meeting meeting_1 s_1330_1400)
    (disallowed_for_meeting meeting_1 s_1400_1430)
  )

  (:goal
    (and
      (scheduled meeting_1 s_1500_1530)
    )
  )
)