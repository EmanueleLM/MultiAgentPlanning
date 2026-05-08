(define (problem trip-20)
  (:domain trip-planning)
  
  (:init
    ; Connectivity (I <-> B, D -> I)
    (has-flight istanbul budapest)
    (has-flight budapest istanbul)
    (has-flight dubrovnik istanbul)

    ; Initial state: Must start at Dubrovnik to ensure connectivity to all cities
    (at dubrovnik)

    ; Tracked fluents
    (= (total-time) 0)
    (= (total-cost) 0)
  )
  (:goal (and
    ; All cities must be visited
    (visited istanbul)
    (visited budapest)
    (visited dubrovnik)
    ; Total duration must be exactly 12 days
    (= (total-time) 12)
  ))
  (:metric minimize (total-cost))