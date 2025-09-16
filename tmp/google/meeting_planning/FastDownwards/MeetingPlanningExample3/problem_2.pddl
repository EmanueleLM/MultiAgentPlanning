(define (problem travel_meet_coordinated_problem)
  (:domain travel_meet_coordinated)
  (:objects
     barbara traveler - person
     bayview golden_gate_park - location
  )
  (:init
     (at traveler bayview)
     (at barbara golden_gate_park)
     (= (time) 540)
  )
  (:goal (met traveler barbara golden_gate_park))
)