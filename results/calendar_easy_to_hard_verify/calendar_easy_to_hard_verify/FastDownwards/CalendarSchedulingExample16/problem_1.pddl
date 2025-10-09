(define (problem CalendarSchedulingExample16-prob)
  (:domain calendar-scheduling)
  (:objects
    olivia anna virginia paul - person
    t09 t10 t11 t12 t13 t14 t15 t16 - time
  )
  (:init
    ; Olivia free times: 09,10,11,15
    (free olivia t09)
    (free olivia t10)
    (free olivia t11)
    (free olivia t15)

    ; Anna free all times 09-16
    (free anna t09)
    (free anna t10)
    (free anna t11)
    (free anna t12)
    (free anna t13)
    (free anna t14)
    (free anna t15)
    (free anna t16)

    ; Virginia free only at 10:00
    (free virginia t10)

    ; Paul free at 10:00 and 12:00
    (free paul t10)
    (free paul t12)
  )
  (:goal (meeting-scheduled))
)