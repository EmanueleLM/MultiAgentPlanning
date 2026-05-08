(define (problem calendar_problem)
  (:domain calendar_scheduling)
  (:objects
    david debra kevin - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 t1700 - time_slot
  )
  (:init
    ;; Temporal ordering
    (next t0900 t0930)
    (next t0930 t1000)
    (next t1000 t1030)
    (next t1030 t1100)
    (next t1100 t1130)
    (next t1130 t1200)
    (next t1200 t1230)
    (next t1230 t1300)
    (next t1300 t1330)
    (next t1330 t1400)
    (next t1400 t1430)
    (next t1430 t1500)
    (next t1500 t1530)
    (next t1530 t1600)
    (next t1600 t1630)
    (next t1630 t1700)

    ;; David is free all day (9:00 to 17:00)
    (free david t0900)
    (free david t0930)
    (free david t1000)
    (free david t1030)
    (free david t1100)
    (free david t1130)
    (free david t1200)
    (free david t1230)
    (free david t1300)
    (free david t1330)
    (free david t1400)
    (free david t1430)
    (free david t1500)
    (free david t1530)
    (free david t1600)
    (free david t1630)

    ;; Debra's free intervals (total slots minus her 6 busy 30-min slots)
    (free debra t0900)
    ;; 09:30-10:00 busy
    (free debra t1000)
    (free debra t1030)
    ;; 11:00-11:30 busy
    (free debra t1130)
    ;; 12:00-13:00 busy
    (free debra t1300)
    (free debra t1330)
    ;; 14:00-14:30 busy
    (free debra t1430)
    (free debra t1500)
    (free debra t1530)
    ;; 16:00-16:30 busy
    (free debra t1630)

    ;; Kevin's free intervals (total slots minus 9:00-12:00 and 14:00-17:00)
    ;; 9:00-12:00 busy
    (free kevin t1200)
    (free kevin t1230)
    (free kevin t1300)
    (free kevin t1330)
    ;; 14:00-17:00 busy
  )
  (:goal (meeting_scheduled))
)