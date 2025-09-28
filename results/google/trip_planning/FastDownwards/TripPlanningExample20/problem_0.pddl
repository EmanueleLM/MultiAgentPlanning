(define (problem trip-istanbul-budapest-dubrovnik)
  (:domain multiagent-trip)
  (:objects
    dubrovnik istanbul budapest - city
    dubrovnik_agent istanbul_agent budapest_agent - agent
  )

  (:init
    ;; start location chosen to respect direct-flight constraints (Dubrovnik->Istanbul exists).
    (at dubrovnik)

    ;; all cities initially unvisited; stay-* actions require unvisited to be true and will mark visited.
    (unvisited dubrovnik)
    (unvisited istanbul)
    (unvisited budapest)

    ;; initial days used
    (= (days-used) 0)
  )

  ;; Goals:
  ;;  - Visit all three cities (visited predicates)
  ;;  - Total trip length must be exactly 12 days (strict constraint)
  ;; Notes:
  ;;  - Only direct flights present in the domain can be used to travel between cities,
  ;;    satisfying the "only use direct flights" requirement.
  (:goal (and
           (visited dubrovnik)
           (visited istanbul)
           (visited budapest)
           (= (days-used) 12)
         ))
)