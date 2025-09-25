(define (problem meet-nancy-orchestration)
  (:domain multiagent-meet)
  (:objects
    traveler nancy - agent
    Sunset Haight - location
  )

  ;; Initial state:
  ;; - Traveler starts at Sunset at 09:00 => current-time = 0
  ;; - Nancy is at Haight-Ashbury
  ;; - No friends met yet
  (:init
    (at traveler Sunset)
    (at nancy Haight)
    (= (current-time) 0)
    (= (friends-met-count) 0)
  )

  ;; Global goal: ensure Nancy is met for the required duration (enforced by traveler-meet-nancy
  ;; which advances time by 75). We require that traveler has met Nancy.
  (:goal (met traveler nancy))

  ;; Objective: maximize the number of friends met.
  ;; This problem provides only Nancy as a known friend, so the planner will attempt to meet her.
  (:metric maximize (friends-met-count))
)