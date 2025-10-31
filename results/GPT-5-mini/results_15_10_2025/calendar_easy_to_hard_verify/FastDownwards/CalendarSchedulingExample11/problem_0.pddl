(define (problem monday-meeting)
  (:domain scheduling)
  (:objects
    madison linda logan virginia - person
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
  )

  (:init
    ;; by default every slot is free (not yet scheduled)
    (slot-free t0900) (slot-free t0930) (slot-free t1000) (slot-free t1030)
    (slot-free t1100) (slot-free t1130) (slot-free t1200) (slot-free t1230)
    (slot-free t1300) (slot-free t1330) (slot-free t1400) (slot-free t1430)
    (slot-free t1500) (slot-free t1530) (slot-free t1600) (slot-free t1630)

    ;; Madison availability (unavailable: 10:00, 14:30, 15:30, 16:30)
    (available madison t0900) (available madison t0930)
    (available madison t1030) (available madison t1100)
    (available madison t1130) (available madison t1200)
    (available madison t1230) (available madison t1300)
    (available madison t1330) (available madison t1400)
    (available madison t1500) (available madison t1600)

    ;; Linda availability (free whole work day)
    (available linda t0900) (available linda t0930) (available linda t1000) (available linda t1030)
    (available linda t1100) (available linda t1130) (available linda t1200) (available linda t1230)
    (available linda t1300) (available linda t1330) (available linda t1400) (available linda t1430)
    (available linda t1500) (available linda t1530) (available linda t1600) (available linda t1630)

    ;; Logan availability (unavailable 09:00-12:00, 12:30-16:00, 16:30-17:00)
    (available logan t1200) (available logan t1600)

    ;; Virginia availability (unavailable 09:30-11:00, 11:30-12:00, 13:00-14:30, 15:00-15:30, 16:00-17:00)
    (available virginia t0900)
    (available virginia t1100)
    (available virginia t1200) (available virginia t1230)
    (available virginia t1430) (available virginia t1530)
  )

  ;; Goal: have one meeting scheduled that satisfies all participant availability constraints.
  (:goal (meeting-scheduled))
)