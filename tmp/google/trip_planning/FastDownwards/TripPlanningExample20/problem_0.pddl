(define (problem integrated-trip)
  (:domain integrated-travel)
  (:objects
    istanbul budapest dubrovnik - city
  )
  (:init
    ;; Public/direct flights (as provided by the two agents).
    ;; We assert both the 'direct' predicate (for flight_checker actions)
    ;; and matching 'flight' facts (so traveler fly actions can also be used).
    (direct istanbul budapest)
    (direct budapest istanbul)
    (direct dubrovnik istanbul)

    (flight istanbul budapest)
    (flight budapest istanbul)
    (flight dubrovnik istanbul)

    ;; No explicit starting 'at' is given here: the planner may use start-at
    ;; to choose the starting city. This is necessary so the planner can
    ;; choose to start at dubrovnik (the only city with outbound direct to Istanbul),
    ;; then use only direct flights to visit all cities.
    ;; Total days available for traveler visit actions:
    (= (days-left) 12)
  )

  ;; Goal: all three cities must be visited.
  (:goal (and
           (visited istanbul)
           (visited budapest)
           (visited dubrovnik)
         ))
)