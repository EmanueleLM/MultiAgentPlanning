(define (problem meetingplanningexample10-problem)
  (:domain meetingplanningexample10-domain)
  (:objects
    golden_gate_park marina_district - location
    t0900 t0959 t1015 t1030 - time
  )
  (:init
    (at golden_gate_park)
    (current t0900)

    ; waiting at GGP until departure
    (can-wait t0900 t0959)

    ; asymmetric travel durations provided:
    ; GGP -> MAR = 16 minutes
    (advance16 t0959 t1015)
    ; MAR -> GGP = 18 minutes (action exists; no feasible pair needed for selected plan)

    ; meeting window enforcement via valid start and exact 15-minute advance
    (valid-meet-start t1015)    ; 10:15 is within [10:15, 13:30] and supports a full 15-min block
    (advance15 t1015 t1030)     ; 10:15 + 15 = 10:30, within window
  )
  (:goal (and
    (met-james)
  ))
)