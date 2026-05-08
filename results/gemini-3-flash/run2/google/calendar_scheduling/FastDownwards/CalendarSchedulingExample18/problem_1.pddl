(define (problem calendar_scheduling_example_18)
  (:domain calendar_scheduling)
  (:objects
    brian billy patricia - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - timeslot
  )
  (:init
    (is_brian brian)
    (is_billy billy)
    (is_patricia patricia)

    ;; Brian is available for all slots 9:00-17:00
    (available brian t0900)
    (available brian t0930)
    (available brian t1000)
    (available brian t1030)
    (available brian t1100)
    (available brian t1130)
    (available brian t1200)
    (available brian t1230)
    (available brian t1300)
    (available brian t1330)
    (available brian t1400)
    (available brian t1430)
    (available brian t1500)
    (available brian t1530)
    (available brian t1600)
    (available brian t1630)

    ;; Billy is busy 10:00-10:30, 11:30-12:00, 14:00-14:30, 16:30-17:00
    ;; Billy avoids after 15:30 (t1530, t1600, t1630 excluded)
    (available billy t0900)
    (available billy t0930)
    ;; 10:00 busy
    (available billy t1030)
    (available billy t1100)
    ;; 11:30 busy
    (available billy t1200)
    (available billy t1230)
    (available billy t1300)
    (available billy t1330)
    ;; 14:00 busy
    (available billy t1430)
    (available billy t1500)
    ;; 15:30 avoid
    ;; 16:00 avoid
    ;; 16:30 busy & avoid

    ;; Patricia is busy 9:00-12:30, 13:30-14:00, 14:30-16:00, 16:30-17:00
    ;; 09:00-12:30 busy (t0900, t0930, t1000, t1030, t1100, t1130, t1200)
    (available patricia t1230)
    (available patricia t1300)
    ;; 13:30 busy
    (available patricia t1400)
    ;; 14:30-16:00 busy (t1430, t1500, t1530)
    (available patricia t1600)
    ;; 16:30 busy
  )
  (:goal (scheduled))
)