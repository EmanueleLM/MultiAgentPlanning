(define (problem meet-william-instance)
  (:domain multiagent-travel-meet)
  (:objects
    traveler william - agent
    nob_hill castro - location
  )
  (:init
    (at traveler nob_hill)
    (= (total-cost) 0)
    (= (met-duration) 0)
    (= (travelled) 0)
    (at 195 (at william castro))
    (at 195 (william-available))
    (at 780 (not (at william castro)))
    (at 780 (not (william-available)))
  )
  (:goal (and (>= (met-duration) 75)))
  (:metric minimize (total-cost))
)