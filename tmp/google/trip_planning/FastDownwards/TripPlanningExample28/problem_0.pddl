(define (problem integrated-euro-itinerary-problem)
  (:domain integrated-euro-itinerary)
  (:objects
    venice zurich florence - city
    florence_agent - agent
  )

  (:init
    ;; Starting locations:
    ;; - agent1 style (agent-less) starts at Venice (from first agent)
    (at venice)

    ;; - agent2 (has an explicit agent object) starts at Zurich (from second agent)
    (at_agent florence_agent zurich)

    ;; - agent3 style (agent-less) also starts at Zurich (from third agent)
    (at zurich)

    ;; Which city is Venice (so agent1's specialized action applies)
    (is-venice venice)

    ;; Direct flight information (provide both predicate names used by different agents)
    ;; From the agents' inputs: Venice <-> Zurich, and Zurich -> Florence
    (direct venice zurich)
    (direct zurich venice)
    (direct zurich florence)

    (direct-flight venice zurich)
    (direct-flight zurich venice)
    (direct-flight zurich florence)

    ;; Numeric fluents initialization (keep all names synchronized)
    (= (days-remaining) 12)
    (= (days-left) 12)
    (= (total-days-used) 0)
    (= (venice-days) 0)
    (= (visited-count) 0)
    (= (cities-left) 3)

    ;; per-city day counters
    (= (days-in venice) 0)
    (= (days-in zurich) 0)
    (= (days-in florence) 0)
  )

  ;; Global integrated goal:
  ;; - Visit the three required cities (Venice, Zurich, Florence)
  ;; - Use exactly the 12-day trip budget (days-remaining = 0)
  (:goal (and
           (visited venice)
           (visited zurich)
           (visited florence)
           (= (days-remaining) 0)
         )
  )
)