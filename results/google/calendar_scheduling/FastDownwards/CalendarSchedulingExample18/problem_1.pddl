(define (problem calendar-scheduling-problem18)
  (:domain calendar-scheduling)
  (:objects
    timeslot_0900 timeslot_0930 timeslot_1000 timeslot_1030 timeslot_1100 timeslot_1130 timeslot_1200 timeslot_1230
    timeslot_1300 timeslot_1330 timeslot_1400 timeslot_1430 timeslot_1500 timeslot_1530 timeslot_1600 timeslot_1630 - timeslot
    lisa dorothy anthony ryan - person
  )
  (:init
    ;; Lisa availability (cannot meet before 14:30; busy intervals enforced)
    (available lisa timeslot_1430)
    (available lisa timeslot_1600)
    (available lisa timeslot_1630)

    ;; Dorothy availability (computed from her busy intervals)
    (available dorothy timeslot_0930)
    (available dorothy timeslot_1000)
    (available dorothy timeslot_1130)
    (available dorothy timeslot_1200)
    (available dorothy timeslot_1230)
    (available dorothy timeslot_1300)
    (available dorothy timeslot_1400)
    (available dorothy timeslot_1530)
    (available dorothy timeslot_1600)
    (available dorothy timeslot_1630)

    ;; Anthony availability (computed from his busy intervals)
    (available anthony timeslot_1000)
    (available anthony timeslot_1030)
    (available anthony timeslot_1230)
    (available anthony timeslot_1400)
    (available anthony timeslot_1430)
    (available anthony timeslot_1630)

    ;; Ryan availability (computed from his busy intervals)
    (available ryan timeslot_1230)
    (available ryan timeslot_1630)
  )
  (:goal (and
    (scheduled timeslot_1630)
    (attending lisa timeslot_1630)
    (attending dorothy timeslot_1630)
    (attending anthony timeslot_1630)
    (attending ryan timeslot_1630)
  ))
)