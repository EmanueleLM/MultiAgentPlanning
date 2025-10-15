(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)
  (:objects
    karen brandon donald kelly - agent
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  (:init
    ;; Karen's available 30-min slots (work hours 09:00-17:00, busy 09:00-10:30 and 16:30-17:00)
    (available karen t1030) (available karen t1100) (available karen t1130)
    (available karen t1200) (available karen t1230) (available karen t1300)
    (available karen t1330) (available karen t1400) (available karen t1430)
    (available karen t1500) (available karen t1530) (available karen t1600)

    ;; Brandon's available slots (busy 09:30-10:00,10:30-11:00,11:30-12:30,15:30-16:00,16:30-17:00)
    (available brandon t0900) (available brandon t1000) (available brandon t1100)
    (available brandon t1230) (available brandon t1300) (available brandon t1330)
    (available brandon t1400) (available brandon t1430) (available brandon t1500)
    (available brandon t1600)

    ;; Donald's available slots (busy 09:00-10:30,11:00-14:00,14:30-17:00)
    (available donald t1030) (available donald t1400)

    ;; Kelly's available slots (busy 09:00-09:30,10:30-11:00,11:30-12:00,13:30-14:00,14:30-15:30,16:00-17:00)
    (available kelly t0930) (available kelly t1000) (available kelly t1100)
    (available kelly t1200) (available kelly t1230) (available kelly t1300)
    (available kelly t1400) (available kelly t1530)
  )

  ;; Earliest feasible common slot (computed from availabilities) is 14:00-14:30
  (:goal (scheduled t1400))
)