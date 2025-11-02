(define (problem plan_sf_meet_carol)
  (:domain sf_meet_carol)
  (:objects
    me - agent
    carol - friend
    nobhill sunset - location
    t0900 t1300 t1325 t1335 t1400 t1515 t1542 t1800 t1827 t2030 t2033 t2057 t2100 - time
  )
  (:init
    (at me nobhill)
    (at-time t0900)
    (friend-at carol sunset)

    ; Waiting options (time progression lattice)
    (can-wait t0900 t1300)
    (can-wait t0900 t1335)
    (can-wait t1300 t1325)
    (can-wait t1325 t1400)
    (can-wait t1335 t1400)
    (can-wait t1400 t1515)
    (can-wait t1400 t2030)
    (can-wait t2030 t2033)

    ; Directional travel options (asymmetric durations)
    (can-travel nobhill sunset t1300 t1325)
    (can-travel nobhill sunset t1335 t1400)

    (can-travel sunset nobhill t1515 t1542)
    (can-travel sunset nobhill t1800 t1827)
    (can-travel sunset nobhill t2030 t2057)
    (can-travel sunset nobhill t2033 t2100)

    ; Feasible meeting intervals within Carol's availability, each >= 75 minutes
    (meeting-interval t1400 t1515)

    ; Full availability window (maximizes time with Carol)
    (full-interval t1400 t2030)
  )
  (:goal
    (and
      (full-meet-with carol)
      (at me nobhill)
    )
  )
)