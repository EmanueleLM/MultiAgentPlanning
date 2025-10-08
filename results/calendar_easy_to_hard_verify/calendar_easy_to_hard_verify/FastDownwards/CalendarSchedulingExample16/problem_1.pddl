(define (problem CalendarSchedulingExample16)
  (:domain calendar-scheduling)
  (:objects
    Olivia Anna Virginia Paul - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
  )
  (:init
    ;; next relations (30-minute steps)
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

    ;; Olivia busy: 12:30-13:30, 14:30-15:00, 16:30-17:00
    (busy Olivia t1230)
    (busy Olivia t1300)
    (busy Olivia t1430)
    (busy Olivia t1630)

    ;; Anna: no busy slots

    ;; Virginia busy: 09:00-10:00, 11:30-16:00, 16:30-17:00
    (busy Virginia t0900)
    (busy Virginia t0930)
    (busy Virginia t1130)
    (busy Virginia t1200)
    (busy Virginia t1230)
    (busy Virginia t1300)
    (busy Virginia t1330)
    (busy Virginia t1400)
    (busy Virginia t1430)
    (busy Virginia t1500)
    (busy Virginia t1530)
    (busy Virginia t1630)

    ;; Paul busy: 09:00-09:30, 11:00-11:30, 13:00-14:00, 14:30-16:00, 16:30-17:00
    (busy Paul t0900)
    (busy Paul t1100)
    (busy Paul t1300)
    (busy Paul t1330)
    (busy Paul t1430)
    (busy Paul t1500)
    (busy Paul t1530)
    (busy Paul t1630)
  )

  (:goal (chosen))
)