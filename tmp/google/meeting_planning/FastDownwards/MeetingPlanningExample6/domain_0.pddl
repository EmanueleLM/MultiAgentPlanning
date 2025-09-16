```
(define (domain multi_agent_meeting)
  (:requirements :strips :fluents :durative-actions :typing)
  (:types location person)
  
  (:predicates
    (at ?p - person ?loc - location)
    (meeting-scheduled)
    (can_meet) ;; used to check initial condition
  )

  (:durative-action meet_kenneth
    :parameters (?visitor - person ?kenneth - person)
    :duration (>= ?duration 90)
    :condition (and 
      (at start (at ?visitor NobHill))
      (at start (at ?kenneth NobHill))
      (at start (can_meet))
    )
    :effect (and
      (at end (meeting-scheduled))
      (at end (not (can_meet)))
    )
  )

  ;; Actions for visitor
  (:action travel_to_nob_hill
    :parameters (?visitor - person)
    :precondition (at ?visitor FishermansWharf)
    :effect (and 
      (not (at ?visitor FishermansWharf))
      (at ?visitor NobHill)
    )
  )

  (:action travel_to_fishermans_wharf
    :parameters (?visitor - person)
    :precondition (at ?visitor NobHill)
    :effect (and 
      (not (at ?visitor NobHill))
      (at ?visitor FishermansWharf)
    )
  )
)
```