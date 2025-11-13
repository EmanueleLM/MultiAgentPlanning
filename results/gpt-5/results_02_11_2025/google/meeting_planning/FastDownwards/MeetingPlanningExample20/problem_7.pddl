(define (problem meet_joseph_sf)
  (:domain meeting_planner_sf)
  (:objects
    traveler - agent
    chinatown nob_hill - location
  )
  (:init
    (at traveler chinatown)
    (start chinatown)
    (feasible-s1)
    (feasible-s2)
    (feasible-s3)
    (= (total-cost) 0)
  )
  (:goal (and
    (having_met_joseph)
  ))
  (:metric minimize (total-cost))
)