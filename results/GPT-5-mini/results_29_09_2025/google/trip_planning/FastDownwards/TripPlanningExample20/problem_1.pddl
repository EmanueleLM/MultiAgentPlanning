(define (problem trip-istanbul-budapest-dubrovnik)
  (:domain multiagent-trip)
  (:objects
    dubrovnik istanbul budapest - city
    dubrovnik_agent istanbul_agent budapest_agent - agent
  )
  (:init
    (at dubrovnik)
    (unvisited dubrovnik)
    (unvisited istanbul)
    (unvisited budapest)
    (= (days-used) 0)
  )
  (:goal (and
           (visited dubrovnik)
           (visited istanbul)
           (visited budapest)
           (= (days-used) 12)
         ))
)