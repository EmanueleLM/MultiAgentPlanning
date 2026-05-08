(define (problem calendar_scheduling_example_49)
  (:domain calendar_scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time_slot
  )
  (:init
    ;; Teresa's busy slots: 9:00-10:00, 13:00-13:30, 14:00-14:30, 15:00-15:30, 16:30-17:00
    (busy teresa t0900)
    (busy teresa t0930)
    (busy teresa t1300)
    (busy teresa t1400)
    (busy teresa t1500)
    (busy teresa t1630)

    ;; Kathleen's busy slots: 9:00-9:30, 12:30-13:00, 13:30-14:00, 15:00-15:30
    (busy kathleen t0900)
    (busy kathleen t1230)
    (busy kathleen t1330)
    (busy kathleen t1500)
    
    ;; Kathleen's preference: rather not meet after 14:30
    ;; This covers any meeting that starts at or after 14:30
    (busy kathleen t1430)
    (busy kathleen t1530)
    (busy kathleen t1600)
    (busy kathleen t1630)

    ;; Patricia's busy slots: 9:00-10:30, 11:30-12:00, 13:00-13:30, 14:00-14:30, 15:30-16:00, 16:30-17:00
    (busy patricia t0900)
    (busy patricia t0930)
    (busy patricia t1000)
    (busy patricia t1130)
    (busy patricia t1300)
    (busy patricia t1400)
    (busy patricia t1530)
    (busy patricia t1630)
  )
  (:goal (meeting_scheduled))
)