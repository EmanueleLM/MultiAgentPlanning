(define (problem travel_meet_coordinated_problem)
  (:domain travel_meet_coordinated)
  (:objects
     barbara traveler - person
     bayview golden_gate_park - location
  )
  (:init
     (at traveler bayview)          ; traveler starts at Bayview (09:00)
     (at barbara golden_gate_park)  ; Barbara starts at Golden Gate Park
     (= (time) 540)                   ; 09:00 in minutes
  )
  (:goal (met traveler barbara golden_gate_park))
)