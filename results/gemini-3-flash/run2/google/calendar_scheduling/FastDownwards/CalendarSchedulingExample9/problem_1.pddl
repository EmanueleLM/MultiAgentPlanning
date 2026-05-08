(define (problem calendarschedulingexample9)
  (:domain calendar_scheduling)
  (:objects
    diane kelly deborah - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 t1700 - time
  )
  (:init
    ;; Time point ordering in 30-minute increments
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030) (next t1030 t1100)
    (next t1100 t1130) (next t1130 t1200) (next t1200 t1230) (next t1230 t1300)
    (next t1300 t1330) (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630) (next t1630 t1700)

    ;; Diane: busy on Monday during 9:00-9:30, 12:00-12:30, 14:30-15:30.
    ;; Diane free slots:
    (free diane t0930 t1000) (free diane t1000 t1030) (free diane t1030 t1100)
    (free diane t1100 t1130) (free diane t1130 t1200) (free diane t1230 t1300)
    (free diane t1300 t1330) (free diane t1330 t1400) (free diane t1400 t1430)
    (free diane t1530 t1600) (free diane t1600 t1630) (free diane t1630 t1700)

    ;; Kelly: busy on Monday during 9:30-10:00, 10:30-11:00.
    ;; Kelly free slots:
    (free kelly t0900 t0930) (free kelly t1000 t1030) (free kelly t1100 t1130)
    (free kelly t1130 t1200) (free kelly t1200 t1230) (free kelly t1230 t1300)
    (free kelly t1300 t1330) (free kelly t1330 t1400) (free kelly t1400 t1430)
    (free kelly t1430 t1500) (free kelly t1500 t1530) (free kelly t1530 t1600)
    (free kelly t1600 t1630) (free kelly t1630 t1700)

    ;; Deborah: busy on Monday during 9:00-9:30, 10:00-14:00, 14:30-17:00.
    ;; Deborah free slots:
    (free deborah t0930 t1000) (free deborah t1400 t1430)
  )
  (:goal (meeting_scheduled))
)