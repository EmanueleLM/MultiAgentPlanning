(define (problem calendar-scheduling-example18-problem)
  (:domain calendar-scheduling-example18)
  (:objects
    lisa dorothy anthony ryan - person
    slot_0900 slot_0930 slot_1000 slot_1030 slot_1100 slot_1130 slot_1200 slot_1230
    slot_1300 slot_1330 slot_1400 slot_1430 slot_1500 slot_1530 slot_1600 slot_1630 - slot
  )
  (:init
    (available lisa slot_1430)
    (available lisa slot_1600)
    (available lisa slot_1630)

    (available dorothy slot_0930)
    (available dorothy slot_1000)
    (available dorothy slot_1130)
    (available dorothy slot_1200)
    (available dorothy slot_1230)
    (available dorothy slot_1300)
    (available dorothy slot_1400)
    (available dorothy slot_1530)
    (available dorothy slot_1600)
    (available dorothy slot_1630)

    (available anthony slot_1000)
    (available anthony slot_1030)
    (available anthony slot_1230)
    (available anthony slot_1400)
    (available anthony slot_1430)
    (available anthony slot_1630)

    (available ryan slot_1230)
    (available ryan slot_1630)
  )
  (:goal (and
    (meeting-scheduled)
    (scheduled-at slot_1630)
  ))
)