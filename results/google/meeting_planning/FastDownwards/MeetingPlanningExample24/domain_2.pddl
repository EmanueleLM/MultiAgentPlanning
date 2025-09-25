(define (domain multi-agent-meetings)
  (:requirements :strips :typing)
  (:types agent location timepoint)

  (:predicates
    (at ?a - agent ?l - location)
    (now ?t - timepoint)
    (travel-slot ?s - timepoint ?e - timepoint)
    (meet-slot ?s - timepoint ?e - timepoint)
    (available-slot ?s - timepoint ?e - timepoint)
    (met-you-matthew)
  )

  (:action travel-you
    :parameters (?s - timepoint ?e - timepoint)
    :precondition (and (now ?s) (at you nobhill) (travel-slot ?s ?e))
    :effect (and (not (at you nobhill)) (at you presidio) (not (now ?s)) (now ?e))
  )

  (:action travel-you-back
    :parameters (?s - timepoint ?e - timepoint)
    :precondition (and (now ?s) (at you presidio) (travel-slot ?s ?e))
    :effect (and (not (at you presidio)) (at you nobhill) (not (now ?s)) (now ?e))
  )

  (:action meet-you-matthew
    :parameters (?s - timepoint ?e - timepoint)
    :precondition (and (now ?s) (at you presidio) (at matthew presidio) (meet-slot ?s ?e) (available-slot ?s ?e))
    :effect (and (met-you-matthew) (not (now ?s)) (now ?e))
  )
)