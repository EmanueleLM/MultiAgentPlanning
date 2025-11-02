(define (problem schedule-monday-30m)
  (:domain meeting-scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
    michael samuel aaron judith kevin - agent
  )

  (:init
    ;; michael free slots (busy: 10:30-11:00, 14:30-15:00)
    (available michael t0900) (available michael t0930) (available michael t1000)
    (available michael t1100) (available michael t1130) (available michael t1200)
    (available michael t1230) (available michael t1300) (available michael t1330)
    (available michael t1400) (available michael t1500) (available michael t1530)
    (available michael t1600) (available michael t1630)

    ;; samuel free slots (busy: 10:30-11:00, 12:30-13:00, 13:30-14:30, 15:30-16:00, 16:30-17:00)
    (available samuel t0900) (available samuel t0930) (available samuel t1000)
    (available samuel t1100) (available samuel t1130) (available samuel t1200)
    (available samuel t1300) (available samuel t1430) (available samuel t1500)
    (available samuel t1600)

    ;; aaron free slots (busy: 11:00-11:30, 12:30-13:00, 13:30-14:00, 15:00-15:30, 16:00-17:00)
    (available aaron t0900) (available aaron t0930) (available aaron t1000) (available aaron t1030)
    (available aaron t1130) (available aaron t1200) (available aaron t1300)
    (available aaron t1400) (available aaron t1430) (available aaron t1530)

    ;; judith free slots (busy: 09:00-09:30, 10:30-11:30, 12:00-12:30, 14:00-15:00, 15:30-16:00, 16:30-17:00)
    (available judith t0930) (available judith t1000) (available judith t1130)
    (available judith t1230) (available judith t1300) (available judith t1330)
    (available judith t1500) (available judith t1600)

    ;; kevin free slots (busy: 09:00-11:00, 11:30-13:00, 13:30-14:00, 14:30-15:00, 15:30-16:00)
    (available kevin t1100) (available kevin t1300) (available kevin t1400)
    (available kevin t1500) (available kevin t1600) (available kevin t1630)
  )

  ;; Goal set to the earliest feasible 30-minute start time that fits every participant:
  (:goal (meeting-start t1300))
)