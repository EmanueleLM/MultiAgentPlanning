(define (problem scheduling-example-15)
  (:domain calendar-scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_point
    joyce christine alexander - agent
  )
  (:init
    ;; --- Joyce Busy Slots (6 facts: 11:00, 13:30, 14:30-16:30) ---
    (is_busy joyce t1100)
    (is_busy joyce t1330)
    (is_busy joyce t1430)
    (is_busy joyce t1500)
    (is_busy joyce t1530)
    (is_busy joyce t1600)

    ;; --- Christine Busy Slots (6 facts: Before 12:00 constraint) ---
    (is_busy christine t0900)
    (is_busy christine t0930)
    (is_busy christine t1000)
    (is_busy christine t1030)
    (is_busy christine t1100)
    (is_busy christine t1130)

    ;; --- Alexander Busy Slots (10 facts) ---
    ;; 9:00 to 11:00
    (is_busy alexander t0900)
    (is_busy alexander t0930)
    (is_busy alexander t1000)
    (is_busy alexander t1030)
    ;; 12:00 to 12:30
    (is_busy alexander t1200)
    ;; 13:30 to 15:00
    (is_busy alexander t1330)
    (is_busy alexander t1400)
    (is_busy alexander t1430)
    ;; 15:30 to 16:00
    (is_busy alexander t1530)
    ;; 16:30 to 17:00
    (is_busy alexander t1630)
  )
  (:goal
    (meeting_scheduled t1230)
  )
)