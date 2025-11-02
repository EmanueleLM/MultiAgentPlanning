(define (problem meetingplanningexample10-problem)
  (:domain meetingplanningexample10-domain)
  (:objects
    t0900 t0959 t1015 t1030 - time
  )
  (:init
    (at golden_gate_park)
    (current t0900)
    (can-wait t0900 t0959)
    (advance16 t0959 t1015)
    (valid-meet-start t1015)
    (advance15 t1015 t1030)
  )
  (:goal (and
    (met-james)
  ))
)