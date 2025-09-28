(define (problem calendar_scheduling_problem)
  (:domain calendar-scheduling)
  (:objects
    noah teresa bradley philip joyce ryan aaron - participant
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    ;; meeting duration encoded
    (meeting-duration-30)

    ;; Noah: free all slots
    (available noah t0900) (available noah t0930) (available noah t1000) (available noah t1030)
    (available noah t1100) (available noah t1130) (available noah t1200) (available noah t1230)
    (available noah t1300) (available noah t1330) (available noah t1400) (available noah t1430)
    (available noah t1500) (available noah t1530) (available noah t1600) (available noah t1630)

    ;; Teresa: busy 11:00-12:00, 14:00-15:00, 16:00-17:00 -> available others
    (available teresa t0900) (available teresa t0930) (available teresa t1000) (available teresa t1030)
    (available teresa t1200) (available teresa t1230) (available teresa t1300) (available teresa t1330)
    (available teresa t1500) (available teresa t1530)

    ;; Bradley: busy 09:00-09:30,10:00-10:30,15:00-15:30,16:00-16:30
    (available bradley t0930) (available bradley t1030) (available bradley t1100) (available bradley t1130)
    (available bradley t1200) (available bradley t1230) (available bradley t1300) (available bradley t1330)
    (available bradley t1400) (available bradley t1430) (available bradley t1530) (available bradley t1630)

    ;; Philip: busy 09:00-09:30,11:30-12:00,12:30-13:00,16:30-17:00
    (available philip t0930) (available philip t1000) (available philip t1030) (available philip t1100)
    (available philip t1200) (available philip t1300) (available philip t1330) (available philip t1400)
    (available philip t1430) (available philip t1500) (available philip t1530) (available philip t1600)

    ;; Joyce: busy 09:30-10:00,11:30-12:30,13:30-14:30,15:30-17:00
    (available joyce t0900) (available joyce t1000) (available joyce t1030) (available joyce t1100)
    (available joyce t1230) (available joyce t1300) (available joyce t1430) (available joyce t1500)

    ;; Ryan: busy 09:00-10:30,11:00-11:30,14:00-17:00
    (available ryan t1030) (available ryan t1130) (available ryan t1200) (available ryan t1230)
    (available ryan t1300) (available ryan t1330)

    ;; Aaron: busy 10:00-12:00,14:00-14:30,15:00-16:30
    (available aaron t0900) (available aaron t0930) (available aaron t1200) (available aaron t1230)
    (available aaron t1300) (available aaron t1330) (available aaron t1430) (available aaron t1630)
  )

  ;; Goal: schedule one 30-minute meeting. A valid common slot is t1300 (13:00-13:30).
  (:goal (meeting-scheduled t1300))
)