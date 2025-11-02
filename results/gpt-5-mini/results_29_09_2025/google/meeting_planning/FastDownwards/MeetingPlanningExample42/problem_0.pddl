(define (problem meet-timothy-problem)
  (:domain traveler-timothy-meeting)
  (:objects
    traveler timothy - agent
    nob_hill presidio - location
  )

  ;; Start at Nob_Hill at 09:00 -> 9*60 = 540 minutes
  (:init
    (at traveler nob_hill)
    ;; Timothy is not initially marked at Presidio; planner must use timothy-start-shift at/after 13:00.
    (= (clock) 540)
    (= (meetings) 0)
  )

  ;; Goal: complete at least one meeting with Timothy. Prioritize earliest completion by minimizing clock.
  (:goal (met-with-timothy))

  ;; FastDownwards / PDDL2.1 metric: minimize the final clock value (earliest finishing time)
  (:metric minimize (clock))
)