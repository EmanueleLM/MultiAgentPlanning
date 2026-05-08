(define (problem calendar_scheduling_example_39)
  (:domain calendar_scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )
  (:init
    ;; Start checking from the earliest slot (9:00 AM)
    (available_to_check t0900)

    ;; Define chronological order of half-hour slots
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

    ;; Emily is free the entire day (9:00 - 17:00)
    (is_free_emily t0900) (is_free_emily t0930) (is_free_emily t1000) (is_free_emily t1030)
    (is_free_emily t1100) (is_free_emily t1130) (is_free_emily t1200) (is_free_emily t1230)
    (is_free_emily t1300) (is_free_emily t1330) (is_free_emily t1400) (is_free_emily t1430)
    (is_free_emily t1500) (is_free_emily t1530) (is_free_emily t1600) (is_free_emily t1630)

    ;; Victoria busy: 13:30-14:00 (t1330), 14:30-15:30 (t1430, t1500), 16:30-17:00 (t1630)
    (is_free_victoria t0900) (is_free_victoria t0930) (is_free_victoria t1000) (is_free_victoria t1030)
    (is_free_victoria t1100) (is_free_victoria t1130) (is_free_victoria t1200) (is_free_victoria t1230)
    (is_free_victoria t1300)
    ;; t1330 is busy
    (is_free_victoria t1400)
    ;; t1430 is busy
    ;; t1500 is busy
    (is_free_victoria t1530) (is_free_victoria t1600)
    ;; t1630 is busy

    ;; Nancy busy: 9:00-14:00 (t0900-t1330), 14:30-15:30 (t1430, t1500)
    ;; t0900 to t1330 are busy
    (is_free_nancy t1400)
    ;; t1430 is busy
    ;; t1500 is busy
    (is_free_nancy t1530) (is_free_nancy t1600) (is_free_nancy t1630)
  )
  (:goal (meeting_scheduled))
)