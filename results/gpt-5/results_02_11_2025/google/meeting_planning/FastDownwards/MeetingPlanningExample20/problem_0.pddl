(define (problem meet_joseph_sf)
  (:domain meeting_planner_sf)
  (:objects
    traveler - agent
    chinatown nob_hill - location
  )
  (:init
    (at traveler chinatown)
    (not (having_met_joseph))
    (= (total-cost) 0)
  )
  (:goal (and
    (having_met_joseph)
  ))
  (:metric minimize (total-cost))
)