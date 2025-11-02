(define (problem meet-barbara-problem)
  (:domain multiagent-travel)
  (:objects
    traveler barbara - person
    north-beach alamo-square - location
  )

  (:init
    (at traveler north-beach)
    (at barbara alamo-square)
    (= (time) 540) ; 09:00 = 540 minutes after midnight
  )

  ;; Goal: meet Barbara (traveler objective: maximize friends met — here encoded as hard goal)
  (:goal (and
           (met barbara)
         )
  )
)