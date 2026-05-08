(define (problem calendar_scheduling_example1)
  (:domain calendar_scheduling)
  (:objects
    raymond billy donald - person
    t0900 t0930 t1000 t1030 t1100 t1130
    t1200 t1230 t1300 t1330 t1400 t1430
    t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ; Raymond's availability: Blocked during 9:00-9:30, 11:30-12:00, 13:00-13:30, 15:00-15:30
    (available raymond t0930)
    (available raymond t1000)
    (available raymond t1030)
    (available raymond t1100)
    (available raymond t1200)
    (available raymond t1230)
    (available raymond t1330)
    (available raymond t1400)
    (available raymond t1430)
    (available raymond t1530)
    (available raymond t1600)
    (available raymond t1630)

    ; Billy's availability: Blocked during 10:00-10:30, 12:00-13:00, 16:30-17:00.
    ; Preference to avoid after 15:00 (i.e., slots starting at or after 15:00) is treated as a hard constraint.
    (available billy t0900)
    (available billy t0930)
    (available billy t1030)
    (available billy t1100)
    (available billy t1130)
    (available billy t1300)
    (available billy t1330)
    (available billy t1400)
    (available billy t1430)

    ; Donald's availability: Blocked during 9:00-9:30, 10:00-11:00, 12:00-13:00, 14:00-14:30, 16:00-17:00
    (available donald t0930)
    (available donald t1100)
    (available donald t1130)
    (available donald t1300)
    (available donald t1330)
    (available donald t1430)
    (available donald t1500)
    (available donald t1530)
  )
  (:goal (exists (?s - timeslot) (meeting_scheduled ?s)))
)