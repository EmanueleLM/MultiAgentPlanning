(define (problem schedule-meeting-diane-kelly-deborah)
  (:domain meeting-scheduling-integrated)
  (:objects
    diane kelly deborah - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )
  (:init
    ;; Diane is busy 9:00-9:30 (t0900), 12:00-12:30 (t1200), 14:30-15:30 (t1430 and t1500)
    ;; so available at all other slots
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

    ;; Kelly is busy 9:30-10:00 (t0930) and 10:30-11:00 (t1030)
    ;; available at other slots
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

    ;; Deborah is busy 9:00-9:30 (t0900), 10:00-14:00 (t1000,t1030,t1100,t1130,t1200,t1230),
    ;; and 14:30-17:00 (t1430,t1500,t1530,t1600,t1630)
    ;; so available only at t0930 and t1400 within work hours
    (available deborah t0930)
    (available deborah t1400)
  )
  (:goal (and
           (meeting_made)
           (meeting_scheduled t1400)
           (scheduled_for diane t1400)
           (scheduled_for kelly t1400)
           (scheduled_for deborah t1400)
         ))
)