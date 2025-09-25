(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling-multiagent)
  (:objects
    alexander elizabeth walter - agent
    slot-0900 slot-0930 slot-1000 slot-1030 slot-1100 slot-1130 slot-1200 slot-1230
    slot-1300 slot-1330 slot-1400 slot-1430 slot-1500 slot-1530 slot-1600 slot-1630 - slot
  )
  (:init
    (free alexander slot-0900)
    (free alexander slot-1000)
    (free alexander slot-1100)
    (free alexander slot-1130)
    (free alexander slot-1200)
    (free alexander slot-1300)
    (free alexander slot-1330)
    (free alexander slot-1400)
    (free alexander slot-1500)
    (free alexander slot-1530)

    (free elizabeth slot-0930)
    (free elizabeth slot-1000)
    (free elizabeth slot-1030)
    (free elizabeth slot-1100)
    (free elizabeth slot-1230)
    (free elizabeth slot-1430)
    (free elizabeth slot-1500)
    (free elizabeth slot-1530)
    (free elizabeth slot-1600)
    (free elizabeth slot-1630)

    (free walter slot-1430)
    (free walter slot-1500)
  )
  (:goal (meeting-scheduled-done))
)