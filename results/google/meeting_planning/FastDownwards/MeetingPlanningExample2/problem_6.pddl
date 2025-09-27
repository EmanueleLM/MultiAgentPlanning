(define (problem meet-jessica-discrete)
  (:domain sf-meet-discrete)
  (:objects
    haight sunset - location
    t0900 t1500 t1515 t1645 t2015 - time
  )
  (:init
    ;; visitor arrives at Haight-Ashbury at 09:00
    (at-visitor haight t0900)

    ;; visitor is available at meeting endpoints
    (available-visitor t1515)
    (available-visitor t1645)

    ;; Jessica is at Sunset District during her availability window (15:15 to 20:15)
    (at-jessica sunset t1515)
    (at-jessica sunset t1645)
    (at-jessica sunset t2015)
    (available-jessica t1515)
    (available-jessica t1645)
    (available-jessica t2015)

    ;; time progression
    (next t0900 t1500)
    (next t1500 t1515)
    (next t1515 t1645)
    (next t1645 t2015)

    ;; 15-minute travel slot to arrive exactly at 15:15
    (slot15 t1500 t1515)

    ;; 90-minute meeting span from 15:15 to 16:45
    (span90 t1515 t1645)
  )
  (:goal (met))
)