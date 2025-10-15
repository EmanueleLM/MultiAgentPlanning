(define (problem schedule-monday-30m)
  (:domain meeting-scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230
    t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - slot
    heather nicholas zachary - person
  )
  (:init
    (next t0900 t0930) (next t0930 t1000) (next t1000 t1030)
    (next t1030 t1100) (next t1100 t1130) (next t1130 t1200)
    (next t1200 t1230) (next t1230 t1300) (next t1300 t1330)
    (next t1330 t1400) (next t1400 t1430) (next t1430 t1500)
    (next t1500 t1530) (next t1530 t1600) (next t1600 t1630)
    (ready t0900)
    ;; heather busy intervals
    (busy heather t0900)
    (busy heather t1030)
    (busy heather t1300)
    (busy heather t1330)
    (busy heather t1430)
    (busy heather t1600)
    ;; zachary busy intervals
    (busy zachary t0900) (busy zachary t0930) (busy zachary t1000)
    (busy zachary t1100) (busy zachary t1130)
    (busy zachary t1230)
    (busy zachary t1330) (busy zachary t1400) (busy zachary t1430)
    (busy zachary t1500) (busy zachary t1530) (busy zachary t1600)
    ;; zachary's soft preference: prefer not to meet at or after 14:00
    (undesirable t1400) (undesirable t1430) (undesirable t1500)
    (undesirable t1530) (undesirable t1600) (undesirable t1630)
  )
  (:goal (meeting-scheduled))
)