(define (problem trip-20)
  (:domain trip-planning)
  (:objects
    istanbul budapest dubrovnik - city
  )
  (:init
    ; Connectivity (I <-> B, D -> I)
    (has-flight istanbul budapest)
    (has-flight budapest istanbul)
    (has-flight dubrovnik istanbul)

    ; Initial state: Starting at Dubrovnik (D is the necessary start for direct flights)
    (at dubrovnik)

    ; Tracked fluents
    (= (total-time) 0)
    (= (total-cost) 0)

    ; Initial visit status
    (not (visited istanbul))
    (not (visited budapest))
    (not (visited dubrovnik))
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
)