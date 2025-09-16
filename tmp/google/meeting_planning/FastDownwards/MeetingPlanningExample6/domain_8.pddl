(define (domain multi_agent_meeting)
  (:requirements :strips :typing :durative-actions)
  (:types location person time)
  
  (:predicates
    (at ?p - person ?loc - location)
    (meeting-scheduled)
    (can_meet)
    (current_time ?t - time)
  )

  (:durative-action meet_kenneth
    :parameters (?visitor - person ?kenneth - person)
    :duration (= ?duration 90)
    :condition (and 
      (at start (at ?visitor NobHill))
      (at start (at ?kenneth NobHill))
      (at start (can_meet))
      (at start (current_time 14.15))
    )
    :effect (and
      (at end (meeting-scheduled))
      (at end (not (can_meet)))
    )
  )

  (:durative-action travel_to_nob_hill
    :parameters (?visitor - person)
    :duration (= ?duration 11)
    :condition (at start (at ?visitor FishermansWharf))
    :effect (and 
      (at end (not (at ?visitor FishermansWharf)))
      (at end (at ?visitor NobHill))
    )
  )

  (:durative-action travel_to_fishermans_wharf
    :parameters (?visitor - person)
    :duration (= ?duration 11)
    :condition (at start (at ?visitor NobHill))
    :effect (and 
      (at end (not (at ?visitor NobHill)))
      (at end (at ?visitor FishermansWharf))
    )
  )
)