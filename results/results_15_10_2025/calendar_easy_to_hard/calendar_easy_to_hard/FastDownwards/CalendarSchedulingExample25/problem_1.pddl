(define (problem CalendarSchedulingExample25)
  (:domain calendar-scheduling)
  (:objects
    t0900 t0930 t1000 t1030 t1100 t1130 t1200 t1230 t1300 t1330 t1400 t1430 t1500 t1530 t1600 t1630 - time
    julia joshua nicholas david melissa - agent
  )
  (:init
    ; Julia availability (computed from private busy times)
    (free julia t0900) (free julia t0930) (free julia t1000) (free julia t1130) (free julia t1230)
    (free julia t1330) (free julia t1430) (free julia t1530) (free julia t1600) (free julia t1630)

    ; Joshua (no meetings) - all slots free
    (free joshua t0900) (free joshua t0930) (free joshua t1000) (free joshua t1030)
    (free joshua t1100) (free joshua t1130) (free joshua t1200) (free joshua t1230)
    (free joshua t1300) (free joshua t1330) (free joshua t1400) (free joshua t1430)
    (free joshua t1500) (free joshua t1530) (free joshua t1600) (free joshua t1630)

    ; Nicholas availability (busy 09:00-09:30, 12:00-12:30, 15:30-16:30)
    (free nicholas t0930) (free nicholas t1000) (free nicholas t1030) (free nicholas t1100)
    (free nicholas t1130) (free nicholas t1230) (free nicholas t1300) (free nicholas t1330)
    (free nicholas t1400) (free nicholas t1430) (free nicholas t1500) (free nicholas t1630)

    ; David availability (busy 09:00-11:00, 12:00-12:30, 13:00-13:30, 14:00-15:00, 16:00-17:00)
    (free david t1100) (free david t1130) (free david t1230) (free david t1330)
    (free david t1500) (free david t1530)

    ; Melissa availability (busy 09:00-09:30, 12:30-13:00, 13:30-15:00, 15:30-17:00)
    (free melissa t0930) (free melissa t1000) (free melissa t1030) (free melissa t1100)
    (free melissa t1130) (free melissa t1200) (free melissa t1300) (free melissa t1500)
  )
  (:goal (scheduled))
)