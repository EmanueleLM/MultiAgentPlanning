(define (domain multi_agent_meeting)
  (:requirements :strips :typing)
  (:types location person)
  
  (:predicates
    (at ?p - person ?loc - location)
    (meeting-scheduled)
    (can_meet)
  )

  (:action meet_kenneth
    :parameters (?visitor - person ?kenneth - person)
    :precondition (and 
      (at ?visitor NobHill)
      (at ?kenneth NobHill)
      (can_meet)
    )
    :effect (and
      (meeting-scheduled)
      (not (can_meet))
    )
  )

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