(define (problem scheduling-example-15)
  (:domain calendar-scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_point
  )
  (:init
    ;; --- Joyce Busy Slots (11:00, 13:30, 14:30-16:30) ---
    (is_busy joyce t1100)
    (is_busy joyce t1330)
    (is_busy joyce t1430)
    (is_busy joyce t1500)
    (is_busy joyce t1530)
    (is_busy joyce t1600)

    ;; --- Christine Busy Slots (Constraint: Cannot meet before 12:00) ---
    (is_busy christine t0900)
    (is_busy christine t0930)
    (is_busy christine t1000)
    (is_busy christine t1030)
    (is_busy christine t1100)
    (is_busy christine t1130)

    ;; --- Alexander Busy Slots (9:00-11:00, 12:00, 13:30-15:00, 15:30, 16:30) ---
    (is_busy alexander t0900)
    (is_busy alexander t0930)
    (is_busy alexander t1000)
    (is_busy alexander t1030)
    (is_busy alexander t1200)
    (is_busy alexander t1330)
    (is_busy alexander t1400)
    (is_busy alexander t1430)
    (is_busy alexander t1530)
    (is_busy alexander t1630)
  )
  (:goal
    (meeting_scheduled t1230)
  )
)