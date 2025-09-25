(define (domain multi-agent-meetings)
  (:requirements :strips :typing)
  (:types agent location timepoint)

  (:predicates
    (at ?a - agent ?l - location)
    (now ?t - timepoint)
    (travel_slot ?s ?e - timepoint)
    (meet_slot ?s ?e - timepoint)
    (available_slot ?s ?e - timepoint)
    (met_you_matthew)
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?s ?e - timepoint)
    :precondition (and (now ?s) (at ?a ?from) (travel_slot ?s ?e))
    :effect (and (not (at ?a ?from)) (at ?a ?to) (not (now ?s)) (now ?e))
  )

  (:action meet
    :parameters (?a - agent ?b - agent ?l - location ?s ?e - timepoint)
    :precondition (and (now ?s) (at ?a ?l) (at ?b ?l) (meet_slot ?s ?e) (available_slot ?s ?e))
    :effect (and (met_you_matthew) (not (now ?s)) (now ?e))
  )
)