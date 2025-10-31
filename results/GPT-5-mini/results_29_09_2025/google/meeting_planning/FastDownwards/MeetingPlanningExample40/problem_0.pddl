(define (problem meet-deborah-problem)
  (:domain friends-meeting)

  (:objects
    you deborah - agent
    castro sunset - location
  )

  ;; Initial state:
  ;; - met-count starts at 0
  ;; - "you" arrive at The Castro at 09:00 (540 minutes since midnight) -> timed initial literal
  ;; - Deborah will be at Sunset District from 14:15 (855) to 20:00 (1200) -> timed initial literals
  ;; No other location facts hold before these times (i.e., you are not at any location before 09:00).
  (:init
    (= (met-count) 0)
    (at 540 (at you castro))
    (at 855 (at deborah sunset))
    (at 1200 (not (at deborah sunset)))
  )

  ;; Hard goal: ensure a meeting with Deborah of at least 75 minutes at Sunset District
  (:goal (and
           (met deborah)
         )
  )

  ;; Objective: maximize number of friends met (met-count).
  ;; With only Deborah provided, planner will schedule at least that meeting and can maximize if more friends were present.
  (:metric maximize (met-count))
)