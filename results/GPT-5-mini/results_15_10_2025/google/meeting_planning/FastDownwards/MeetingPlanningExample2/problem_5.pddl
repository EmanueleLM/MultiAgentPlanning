(define (problem meet-jessica-discrete)
  (:domain sf-meet-discrete)
  (:objects
    visitor jessica - agent
    haight sunset - location
    t0 t360 t375 t465 t675 - time
  )
  (:init
    ;; visitor arrives at Haight-Ashbury at 09:00 (t0)
    (at-visitor haight t0)

    ;; visitor is available during meeting endpoints we consider
    (available-visitor t375)
    (available-visitor t465)

    ;; Jessica is at Sunset District during her availability window (include endpoints)
    (at-jessica sunset t375)
    (at-jessica sunset t465)
    (at-jessica sunset t675)
    (available-jessica t375)
    (available-jessica t465)
    (available-jessica t675)

    ;; time progression
    (next t0 t360)
    (next t360 t375)
    (next t375 t465)
    (next t465 t675)

    ;; 15-minute travel slots (minutes)
    (slot15 t360 t375)
    (slot15 t465 t675) ;; included for completeness if needed

    ;; 90-minute span from 15:15 (t375) to 16:45 (t465)
    (span90 t375 t465)
  )
  (:goal (met))
)