(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    diane kelly deborah - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )

  (:init
    ;; Diane available times (within 09:00-17:00, excluding her busy intervals 09:00-09:30, 12:00-12:30, 14:30-15:30)
    (available diane t0930)
    (available diane t1000)
    (available diane t1030)
    (available diane t1100)
    (available diane t1130)
    (available diane t1230)
    (available diane t1300)
    (available diane t1330)
    (available diane t1400)
    (available diane t1530)
    (available diane t1600)
    (available diane t1630)

    ;; Kelly available times (excluding her busy intervals 09:30-10:00, 10:30-11:00)
    (available kelly t0900)
    (available kelly t1000)
    (available kelly t1100)
    (available kelly t1130)
    (available kelly t1200)
    (available kelly t1230)
    (available kelly t1300)
    (available kelly t1330)
    (available kelly t1400)
    (available kelly t1430)
    (available kelly t1500)
    (available kelly t1530)
    (available kelly t1600)
    (available kelly t1630)

    ;; Deborah available times (excluding her busy intervals 09:00-09:30, 10:00-14:00, 14:30-17:00)
    (available deborah t0930)
    (available deborah t1400)
  )

  ;; Goal: meeting scheduled (the planner will bind a time that satisfies all availability constraints)
  (:goal (scheduled))
)