(define (problem coordinated-meet-ronald)
  (:domain coordinated-meetings)

  (:objects
    visitor ronald - agent
    chinatown russian-hill - location
    t0 t7 t375 t480 t750 - timepoint
  )

  (:init
    (at visitor chinatown)
    (at ronald chinatown)
    (time-is t0)
    (available-start t375)
    (available-end t750)
  )

  (:goal (met_105))
)