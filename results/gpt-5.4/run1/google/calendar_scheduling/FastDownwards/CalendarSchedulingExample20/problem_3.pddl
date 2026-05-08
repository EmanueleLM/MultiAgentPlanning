(define (problem calendar_scheduling_example20_problem)
  (:domain calendar_scheduling_example20)

  (:objects
    meeting_ralph_peter_daniel - meeting
    s0900_0930
    s0930_1000
    s1000_1030
    s1030_1100
    s1100_1130
    s1130_1200
    s1200_1230
    s1230_1300
    s1300_1330
    s1330_1400
    s1400_1430
    s1430_1500
    s1500_1530
    s1530_1600
    s1600_1630
    s1630_1700 - slot
  )

  (:init
    (meeting_unscheduled meeting_ralph_peter_daniel)

    (participant_required meeting_ralph_peter_daniel ralph)
    (participant_required meeting_ralph_peter_daniel peter)
    (participant_required meeting_ralph_peter_daniel daniel)

    (free ralph s0900_0930)
    (free ralph s0930_1000)
    (free ralph s1000_1030)
    (free ralph s1030_1100)
    (free ralph s1100_1130)
    (free ralph s1130_1200)
    (free ralph s1200_1230)
    (free ralph s1230_1300)
    (free ralph s1300_1330)
    (free ralph s1400_1430)
    (free ralph s1500_1530)
    (free ralph s1530_1600)
    (free ralph s1600_1630)
    (free ralph s1630_1700)

    (free peter s0930_1000)
    (free peter s1000_1030)
    (free peter s1030_1100)
    (free peter s1300_1330)
    (free peter s1330_1400)
    (free peter s1400_1430)
    (free peter s1430_1500)
    (free peter s1500_1530)
    (free peter s1530_1600)
    (free peter s1630_1700)

    (free daniel s1000_1030)
    (free daniel s1530_1600)

    (preferred daniel s1000_1030)
  )

  (:goal
    (and
      (scheduled_at meeting_ralph_peter_daniel s1000_1030)
    )
  )
)