(define (problem meet-jessica-discrete)
  (:domain sf-meet-discrete)
  (:objects
    visitor jessica - agent
    haight sunset - location
    t0 t360 t375 t465 t675 - time
  )
  (:init
    (at-visitor haight t0)

    (available-visitor t375)
    (available-visitor t465)

    (at-jessica sunset t375)
    (at-jessica sunset t465)
    (available-jessica t375)
    (available-jessica t465)

    (next t0 t360)
    (next t360 t375)
    (next t375 t465)
    (next t465 t675)

    (slot15 t360 t375)

    (span90 t375 t465)
  )
  (:goal (met))
)