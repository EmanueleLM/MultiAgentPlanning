(define (domain multi-agent-meetings)
  (:requirements :adl :typing)
  (:types agent location timepoint)

  (:predicates
    (at ?a - agent ?l - location)
    (now ?t - timepoint)
    (travel-slot ?s - timepoint ?e - timepoint)
    (meet-slot ?s - timepoint ?e - timepoint)
    (available-slot ?s - timepoint ?e - timepoint)
    (met-you-matthew)
  )

  (:action travel
    :parameters (?a - agent ?from - location ?to - location ?s - timepoint ?e - timepoint)
    :precondition (and (now ?s) (at ?a ?from) (travel-slot ?s ?e))
    :effect (and (not (at ?a ?from)) (at ?a ?to) (not (now ?s)) (now ?e))
  )

  (:action meet
    :parameters (?a - agent ?b - agent ?l - location ?s - timepoint ?e - timepoint)
    :precondition (and (now ?s) (at ?a ?l) (at ?b ?l) (meet-slot ?s ?e) (available-slot ?s ?e))
    :effect (and (met-you-matthew) (not (now ?s)) (now ?e))
  )
)