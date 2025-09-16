(define (domain multi_agent_meeting)
  (:requirements :strips :typing)
  (:types location person time)
  
  (:predicates
    (at ?p - person ?loc - location)
    (meeting-scheduled ?visitor ?kenneth - person)
    (can-meet ?visitor ?kenneth - person)
    (current_time ?t - time)
  )

  (:action meet_kenneth
    :parameters (?visitor - person ?kenneth - person)
    :precondition (and 
      (at ?visitor NobHill)
      (at ?kenneth NobHill)
      (can-meet ?visitor ?kenneth)
      (current_time 14.15)
    )
    :effect (and
      (meeting-scheduled ?visitor ?kenneth)
      (not (can-meet ?visitor ?kenneth))
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