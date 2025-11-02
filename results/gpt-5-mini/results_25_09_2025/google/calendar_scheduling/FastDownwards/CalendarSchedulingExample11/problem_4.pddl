(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling-multiagent)
  (:objects
    alexander elizabeth walter - agent
    slot_0900 slot_0930 slot_1000 slot_1030 slot_1100 slot_1130 slot_1200 slot_1230
    slot_1300 slot_1330 slot_1400 slot_1430 slot_1500 slot_1530 slot_1600 slot_1630 - slot
  )
  (:init
    (free alexander slot_0900)
    (free alexander slot_1000)
    (free alexander slot_1100)
    (free alexander slot_1130)
    (free alexander slot_1200)
    (free alexander slot_1300)
    (free alexander slot_1330)
    (free alexander slot_1400)
    (free alexander slot_1500)
    (free alexander slot_1530)

    (free elizabeth slot_0930)
    (free elizabeth slot_1000)
    (free elizabeth slot_1030)
    (free elizabeth slot_1100)
    (free elizabeth slot_1200)
    (free elizabeth slot_1230)
    (free elizabeth slot_1430)
    (free elizabeth slot_1500)
    (free elizabeth slot_1530)
    (free elizabeth slot_1600)
    (free elizabeth slot_1630)

    (free walter slot_1430)
    (free walter slot_1500)
  )
  (:goal (meeting_scheduled_done))
)