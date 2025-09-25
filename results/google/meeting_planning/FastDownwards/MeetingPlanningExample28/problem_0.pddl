(define (problem meet-joshua)
  (:domain meeting-planning)
  (:objects you joshua - agent
            union_square chinatown - location)
  (:init
    ;; start at 09:00 -> 9*60 = 540
    (= (current-time) 540)
    (= (meet-minutes) 0)

    ;; initial positions / availability known to agents
    (at you union_square)
    ;; Joshua is not at Chinatown initially. He will become present via joshua-arrive-chinatown at/after 1080.
  )

  ;; Goal: accumulate at least 75 minutes of meeting.
  (:goal (and (>= (meet-minutes) 75)))

  ;; Optimize: maximize meeting minutes (planner will try to maximize total meet-minutes subject to constraints)
  (:metric maximize (meet-minutes))
)