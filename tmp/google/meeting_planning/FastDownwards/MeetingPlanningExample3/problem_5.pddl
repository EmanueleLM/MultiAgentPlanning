(define (problem travel_meet_coordinated_problem)
  (:domain travel_meet_coordinated)
  (:objects
     traveler barbara - person
     bayview golden_gate_park - location
     t0 t1 t2 - timepoint
  )
  (:init
     (at traveler bayview t0)
     (at barbara golden_gate_park t0)
  )
  (:goal (met traveler barbara))
)