(define (problem plan_carol_meeting)
  (:domain meet_carol)
  (:objects
    me - agent
    carol - friend
    nobhill sunset - location
    t0900 t1300 t1325 t1335 t1400 t1515 t1542 t1800 t1827 t1915 t2030 t2033 t2057 t2100 - time
  )
  (:init
    (at me nobhill)
    (at-time t0900)

    (friend-at carol sunset)

    ; waiting options to represent alternative schedules
    (can-wait t0900 t1300)
    (can-wait t0900 t1335)
    (can-wait t1300 t1325)
    (can-wait t1325 t1400)
    (can-wait t1335 t1400)
    (can-wait t1400 t1915)
    (can-wait t2030 t2033)

    ; travel options and timing (directional)
    (can-travel nobhill sunset t1300 t1325)
    (can-travel nobhill sunset t1335 t1400)
    (can-travel sunset nobhill t1515 t1542)
    (can-travel sunset nobhill t1800 t1827)
    (can-travel sunset nobhill t2030 t2057)
    (can-travel sunset nobhill t2033 t2100)

    ; feasible meeting intervals within Carol's availability window
    (meeting-interval t1400 t1515)
    (meeting-interval t1915 t2030)

    ; full-window meeting to maximize time with Carol
    (full-interval t1400 t2030)
  )
  (:goal
    (and
      (full-meet-with carol)
      (at me nobhill)
      (at-time t2057)
    )
  )
)