(define (problem schedule_combined_meeting)
  (:domain meeting_scheduler_multi_agent)

  (:objects
    michelle steven jerry - agent
    monday_0900 monday_0930 monday_1000 monday_1030 monday_1100
    monday_1130 monday_1200 monday_1230 monday_1300 monday_1330
    monday_1400 monday_1430 monday_1500 monday_1530
    monday_1600 monday_1630 monday_1700
    - time_slot
  )

  (:init
    (available michelle monday_0900)
    (available michelle monday_0930)
    (available michelle monday_1000)
    (available michelle monday_1030)
    (available michelle monday_1200)

    (available steven monday_1000)
    (available steven monday_1100)
    (available steven monday_1330)
    (available steven monday_1430)

    (available jerry monday_1000)
    (available jerry monday_1100)
    (available jerry monday_1300)
    (available jerry monday_1400)
  )

  (:goal
    (exists (?t - time_slot)
      (meeting_scheduled ?t)
    )
  )
)